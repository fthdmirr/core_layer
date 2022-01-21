import 'package:core_layer/core/enums/service/service_enums.dart';
import 'package:core_layer/core/interfaces/IService.dart';
import 'package:core_layer/core/models/base_model.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

part '../../extensions/service_extensions.dart';

class ServiceManager implements IService {
//TODO: use more efficent generic type
//TODO: rethink for can you do better version of this
  static ServiceManager? _instance;

  static ServiceManager get instance {
    return _instance ??= ServiceManager._init();
  }

  ServiceManager._init();

  @override
  Future<R>? getData<R, T extends BaseModel>(
      ServiceHttpsEnum url, T model) async {
    late R data; //!!
    try {
      final response = await http.get(url.getURL);
      if (response.statusCode == 200) {
        data = await compute(parseData<R, T>, [model, response.body]);
      }
      return data;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<T>? postData<T extends BaseModel>(
      ServiceHttpsEnum url, T model) async {
    final response = await http.post(
      url.parseURL(),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(model.toJson()),
    );
    if (response.statusCode == 201) {
      return model.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to post $T');
    }
  }

  @override
  Future<T>? updateData<T extends BaseModel>(
      ServiceHttpsEnum url, T model, Object id) async {
    final response = await http.put(
      url.parseURL(id: id),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(model.toJson()),
    );
    if (response.statusCode == 200) {
      return model.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update $T');
    }
  }

  @override
  Future<T>? deleteData<T extends BaseModel>(
      ServiceHttpsEnum url, T model, int id) async {
    final http.Response response = await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return model;
    } else {
      throw Exception('Failed to delete $T.');
    }
  }
}
