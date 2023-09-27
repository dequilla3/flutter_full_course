import 'package:flutter/material.dart';
import 'package:flutter_full_course/config/app_routes.dart';
import 'package:flutter_full_course/provider/app_repo.dart';
import 'package:flutter_full_course/style/app_colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<AppRepo>(
    create: (context) => AppRepo(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Urbanist',
          scaffoldBackgroundColor: AppColors.background,
          brightness: Brightness.dark),
      initialRoute: '/',
      routes: AppRoutes.pages,
    );
  }
}
