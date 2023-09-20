import 'package:flutter/material.dart';
import 'package:flutter_full_course/style/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Text('TestFlutter'),
        actions: const [Icon(Icons.location_on_outlined)],
      ),
      body: Container(),
    );
  }
}
