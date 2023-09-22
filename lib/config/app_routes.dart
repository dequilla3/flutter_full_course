import 'package:flutter_full_course/pages/edit_profile_page.dart';
import 'package:flutter_full_course/pages/home_page.dart';
import 'package:flutter_full_course/pages/login_page.dart';
import 'package:flutter_full_course/pages/main_page.dart';

class AppRoutes {
  static const loginPage = '/';
  static const homePage = '/home';
  static const mainPage = '/main';
  static const editProfilePage = '/edit_profile';

  static final pages = {
    '/': (context) => const LoginPage(),
    '/home': (context) => HomePage(),
    '/main': (context) => const MainPage(),
    '/edit_profile': (context) => const EditProfilePage()
  };
}
