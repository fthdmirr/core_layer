import 'package:core_layer/core/const/hive_const.dart';
import 'package:core_layer/core/enums/service/service_enums.dart';
import 'package:core_layer/core/init/cache/hive_cache.dart';
import 'package:core_layer/core/init/services/service_manager.dart';
import 'package:core_layer/core/interfaces/ICache.dart';

import 'model.dart';

class TestService {
  Future<List<Post>> getPosts() async {
    return await ServiceManager.instance.getData<List<Post>, Post>(
            ServiceHttpsEnum.postsJsonplaceholder,Post()) ??
        [];
  }

  Future<Post> postPost(Post post) async {
    return await ServiceManager.instance
            .postData<Post>(ServiceHttpsEnum.postsJsonplaceholder, post) ??
        Post();
  }
  
  Future<Post> updatePost(Post post) async {
    return await ServiceManager.instance
            .updateData<Post>(ServiceHttpsEnum.postsJsonplaceholder, post,1) ??
        Post();
  }
  Future<Post> deletePost(Post post) async {
    return await ServiceManager.instance
            .deleteData<Post>(ServiceHttpsEnum.postsJsonplaceholder, post,1) ??
        Post();
  }
}

class TestCache {
  final ICache cache;

  TestCache(this.cache);

  init() {
    (cache as HiveCache)
        .registerAdapters<Post>(HiveConstants.USER_BOX, PostAdapter());
    cache.initCache();
  }

  Future<void> addAllDatas(List<Post> datas) async {
    await cache.saveAllData(datas);
  }

  Future<List<Post>> getAllPost() async {
    return await cache.getAllData<Post>() ?? [];
  }
}
