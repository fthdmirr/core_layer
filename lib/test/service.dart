import 'package:core_layer/core/enums/service_url_enum.dart';
import 'package:core_layer/core/services/service_manager.dart';

import 'model.dart';

class TestService {
  Future<List<Post>> getPosts() async {
   return await ServiceManager.instance.getData<List<Post>,Post>(Post(), ServiceHttpsEnum.posts) ?? [];
  }
}