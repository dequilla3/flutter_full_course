import 'package:flutter_full_course/model/user_model.dart';

class Post {
  final int? id;
  final String? message;
  final UserModel? owner;
  final DateTime? date;
  final String? image;

  Post(this.id, this.message, this.owner, this.date, this.image);

  factory Post.fromJson(Map<String, dynamic> json) => Post(
      json['id'],
      json['message'],
      json['id'] == null ? null : UserModel.fromJson(json['ownder']),
      json['date'] == null ? null : DateTime.parse(json['date']),
      json['image']);
}
