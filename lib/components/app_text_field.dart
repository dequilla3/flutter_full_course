import 'package:flutter/material.dart';
import 'package:flutter_full_course/style/app_colors.dart';

class AppTextField extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final ValueChanged<String>? onChange;
  final bool isObscureText;
  final FocusNode? focusNode;
  final int? maxLines;
  const AppTextField(
      {super.key,
      this.hint,
      this.controller,
      this.onChange,
      this.isObscureText = false,
      this.focusNode,
      this.maxLines});

  @override
  Widget build(Object context) {
    return SizedBox(
      height: 40,
      child: TextField(
        style: const TextStyle(fontSize: 14),
        obscureText: isObscureText,
        onChanged: onChange,
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          isDense: true,
          labelText: hint,
          labelStyle: const TextStyle(color: Colors.white, fontSize: 12),
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary),
          ),
          filled: true,
        ),
      ),
    );
  }
}
