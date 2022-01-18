import 'package:core_layer/test/model.dart';
import 'package:core_layer/test/service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Is service layer working?', () async {
    final service = TestService();

    List<Post> posts =await service.getPosts();

    expect(posts, isNotEmpty);
  });
}
