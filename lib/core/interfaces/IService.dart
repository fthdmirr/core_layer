import 'package:core_layer/core/enums/service/service_enums.dart';
import 'package:core_layer/core/models/base_model.dart';

abstract class IService {
  Future<R>? getData<R,T extends BaseModel>(ServiceHttpsEnum url,T model,);
  Future<T>? postData<T extends BaseModel>(ServiceHttpsEnum url, T model);
  Future<T>? updateData<T extends BaseModel>(ServiceHttpsEnum url, T model,int id);
  Future<T>? deleteData<T extends BaseModel>(ServiceHttpsEnum url, T model,int id);
}
