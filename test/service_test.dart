import 'package:core_layer/core/init/cache/hive_cache.dart';
import 'package:core_layer/test/model.dart';
import 'package:core_layer/test/service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  setUp(() {
    Hive.init('Test');
  });
  test('Is service layer working?', () async {
    final service = TestService();

    List<Post> posts = await service.getPosts();

    expect(posts, isNotEmpty);
  });
  test('Is cache layer working?', () async {
    final service = TestService();
    final cache = TestCache(HiveCache('fthdmirr'));
    cache.init();

    List<Post> posts = await service.getPosts();
    await cache.addAllDatas(posts);
    List<Post> postFromCache = await cache.getAllPost();

    expect(postFromCache, isNotEmpty);
  });
}
