import 'package:flutter/widgets.dart';
import 'package:flutter_full_course/data/response/login_response.dart';
import 'package:flutter_full_course/data/services/login_service.dart';

class LoginProvider extends ChangeNotifier {
  var username = '';
  var password = '';
  Future<LoginResponse> login() async {
    return LoginService(username: username, password: password).call();
  }
}
