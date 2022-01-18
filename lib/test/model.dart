

import 'package:core_layer/core/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part  'model.g.dart';

@JsonSerializable()
class Post implements BaseModel<Post> {
  int? userId;
  int? id;
  String? title;
  String? body;

  Post({this.userId, this.id, this.title, this.body});

 

  Post.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    userId = json['userId'];
    title = json['title'];
    body = json['body'];
  }

  @override
  Map<String, dynamic> toJson() {
    return _$PostToJson(this);
  }

  @override
  Post fromJson(Map<String, dynamic> json) {
    return _$PostFromJson(json);
  }

}