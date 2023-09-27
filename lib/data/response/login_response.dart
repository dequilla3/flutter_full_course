import 'package:flutter_full_course/model/user_model.dart';

class LoginResponse {
  final UserModel user;
  final String token;

  LoginResponse(this.user, this.token);

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      UserModel.fromJson(json['user']),
      json['access_token'],
    );
  }
}
