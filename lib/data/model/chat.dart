import 'package:flutter_full_course/data/model/user_model.dart';

class Chat {
  final String message;
  final UserModel user;

  Chat(this.message, this.user);

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(json['message'], UserModel.fromJson(json['user']));
  }
}
