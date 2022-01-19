import 'package:core_layer/core/const/hive_const.dart';
import 'package:core_layer/core/models/base_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveConstants.USER_BOX)
class Post implements BaseModel<Post> {
  Post({this.userId, this.id, this.title, this.body});

  @HiveField(0)
  int? userId;

  @HiveField(1)
  int? id;

  @HiveField(2)
  String? title;

  @HiveField(3)
  String? body;

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
