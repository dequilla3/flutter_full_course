import 'package:flutter_full_course/pages/home_page.dart';
import 'package:flutter_full_course/pages/login_page.dart';
import 'package:flutter_full_course/pages/main_page.dart';
import 'package:flutter_full_course/pages/nearby_page.dart';

class AppRoutes {
  static const loginPage = '/';
  static const homePage = '/home';
  static const mainPage = '/main';
  static const editProfilePage = '/edit_profile';
  static const nearbyPage = '/nearby_page';

  static final pages = {
    loginPage: (context) => const LoginPage(),
    homePage: (context) => HomePage(),
    mainPage: (context) => const MainPage(),
    nearbyPage: (context) => const NearByPage(),
  };
}
