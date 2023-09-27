import 'package:flutter/material.dart';
import 'package:flutter_full_course/model/user_model.dart';

class AppRepo extends ChangeNotifier {
  String? _token;
  UserModel? user;

  set token(String? value) {
    _token = value;
  }

  String? get token => _token;
}
