import 'package:flutter/material.dart';
import 'package:flutter_full_course/style/app_colors.dart';

class AppTextFieldExpandable extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final ValueChanged<String>? onChange;
  final FocusNode? focusNode;
  final int? maxLines;
  final int? minLines;
  const AppTextFieldExpandable(
      {super.key,
      this.hint,
      this.controller,
      this.onChange,
      this.focusNode,
      this.maxLines,
      this.minLines});

  @override
  Widget build(Object context) {
    return TextField(
      maxLines: maxLines,
      minLines: minLines,
      style: const TextStyle(fontSize: 14),
      onChanged: onChange,
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        isDense: true,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white60, fontSize: 12),
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
        ),
        filled: true,
      ),
    );
  }
}
