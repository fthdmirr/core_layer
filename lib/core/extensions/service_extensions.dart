import 'package:core_layer/core/enums/service_url_enum.dart';

extension ServiceUrlExtension on ServiceHttpsEnum {
  get getURL {
    switch (this) {
      case ServiceHttpsEnum.posts:
        return Uri.https('jsonplaceholder.typicode.com', '/posts');
      default:
    }
  }
}
