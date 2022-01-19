import 'package:core_layer/core/const/hive_const.dart';
import 'package:core_layer/core/enums/service/service_url_enum.dart';
import 'package:core_layer/core/init/cache/hive_cache.dart';
import 'package:core_layer/core/init/services/service_manager.dart';
import 'package:core_layer/core/interfaces/ICache.dart';

import 'model.dart';

class TestService {
  Future<List<Post>> getPosts() async {
    return await ServiceManager.instance.getData<List<Post>, Post>(
            Post(), ServiceHttpsEnum.postsJsonplaceholder) ??
        [];
  }
}

class TestCache {
  final ICache cache;

  TestCache(this.cache);

  init() {
    (cache as HiveCache).registerAdapters<Post>(HiveConstants.USER_BOX, PostAdapter());
    cache.initCache();

  }

  Future<void> addAllDatas(List<Post> datas) async {
    await cache.saveAllData(datas);
  }

  Future<List<Post>> getAllPost() async {
    return await cache.getAllData<Post>() ?? [];
  }
}
