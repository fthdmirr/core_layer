import 'package:core_layer/core/enums/service_methods_enum.dart';
import 'package:core_layer/core/enums/service_url_enum.dart';
import 'package:core_layer/core/extensions/service_extensions.dart';
import 'package:core_layer/core/interfaces/IService.dart';
import 'package:core_layer/core/models/base_model.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ServiceManager implements IService {
//TODO: use more efficent generic type
//TODO: find better variable names
//TODO: rethink for can you do better version of this
  static ServiceManager? _instance;

  static ServiceManager get instance {
    return _instance ??= ServiceManager._init();
  }

  ServiceManager._init();

  Future<R>? serviceMethods<R, T extends BaseModel>(
      ServiceMethodsEnum serviceMethods, T model, ServiceHttpsEnum url) {
    switch (serviceMethods) {
      case ServiceMethodsEnum.get:
        return getData(model, url);
      default:
        //TODO: make better
        throw 'Something went wrong in serviceManager';
    }
  }

  @override
  Future<R>? getData<R, T extends BaseModel>(
      T model, ServiceHttpsEnum url) async {
        
    late R data; //!! that can be wrong
    try {
      final response = await http.get(url.getURL);
      if (response.statusCode == 200) {
        data = await compute(parseData<R,T>, [model, response.body]);
      }
      return data;
    } catch (e) {
      throw Exception(e);
    }
  }
}

R parseData<R, T extends BaseModel>(List data) {
  final parsed = jsonDecode(data[1]);

  if (parsed is Map<String, dynamic>) {
    return (data[0] as T).fromJson(parsed) as R;
  } else if (parsed is List<dynamic>) {
    return parsed.map((e) => (data[0] as T).fromJson(e)).toList().cast<T>() as R;
  } else {
    return parsed;
  }
}
