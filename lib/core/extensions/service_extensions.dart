import 'package:core_layer/core/enums/service/service_url_enum.dart';

extension ServiceUrlExtension on ServiceHttpsEnum {
  get getURL {
    switch (this) {
      case ServiceHttpsEnum.postsJsonplaceholder:
        return Uri.https('jsonplaceholder.typicode.com', '/posts');
      default:
    }
  }
}
