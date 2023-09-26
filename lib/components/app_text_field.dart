import 'package:flutter/material.dart';
import 'package:flutter_full_course/style/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  const AppTextField({super.key, required this.hint, required this.controller});

  @override
  Widget build(Object context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hint,
          labelText: hint,
          labelStyle: const TextStyle(color: Colors.white),
          border: UnderlineInputBorder(borderRadius: BorderRadius.circular(12)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(12))),
          filled: true,
          fillColor: AppColors.fieldColor),
    );
  }
}
