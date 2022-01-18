import 'package:core_layer/core/enums/service_url_enum.dart';
import 'package:core_layer/core/models/base_model.dart';

abstract class IService {
  Future<R>? getData<R,T extends BaseModel>(T model, ServiceHttpsEnum url);
}
