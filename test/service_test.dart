import 'package:core_layer/core/init/cache/hive_cache.dart';
import 'package:core_layer/test/model.dart';
import 'package:core_layer/test/service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  setUp(() {
    Hive.init('Test');
  });
  test('Is service layer get method working?', () async {
    final service = TestService();

    List<Post> posts = await service.getPosts();

    expect(posts, isNotEmpty);
  });
     test('Is service layer post method working?', () async {
    final service = TestService();

   Post post = await service.postPost(Post(body: '',id: 6556,title: '',userId:586));

    expect(post, isNotNull);
  }); 

    test('Is service layer update method working?', () async {
    final service = TestService();

   Post post = await service.updatePost(Post(body: '1',id: 6556,title: '2',userId:586));

    expect(post, isNotNull);
  });
    test('Is service layer delete method working?', () async {
    final service = TestService();

     Post post = await service.deletePost(Post(body: '1',id: 6556,title: '2',userId:586));

    expect(post, isNotNull);
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
