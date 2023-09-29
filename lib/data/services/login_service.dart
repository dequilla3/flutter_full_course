import 'dart:convert';

import 'package:flutter_full_course/config/app_config.dart';
import 'package:flutter_full_course/data/response/login_response.dart';
import 'package:flutter_full_course/data/services/base_service.dart';
import 'package:http/http.dart' as http;

class LoginService extends ServiceBase<LoginResponse> {
  final String username;
  final String password;
  LoginService({required this.username, required this.password});

  Future<LoginResponse> call() async {
    final result =
        await http.post(Uri.parse('${AppConfig.baseUrl}/auth/login'), body: {
      'username': username,
      'password': password,
    });

    // throw Exception();
    final resbody = jsonDecode(result.body);
    if (resbody['statusCode'] == 401) throw Exception(resbody['message']);

    return LoginResponse.fromJson(resbody);
  }
}
