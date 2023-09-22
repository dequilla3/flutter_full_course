import 'package:flutter/material.dart';
import 'package:flutter_full_course/style/app_colors.dart';
import 'package:flutter_full_course/style/app_text.dart';

class ToolBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  const ToolBar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.background,
        title: Text(
          title,
          style: AppText.header1,
        ),
        centerTitle: false,
        actions: actions);
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
