import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_full_course/components/app_text_field_expandable.dart';
import 'package:flutter_full_course/provider/app_repo.dart';
import 'package:flutter_full_course/provider/post_provider.dart';
import 'package:flutter_full_course/style/app_colors.dart';
import 'package:flutter_full_course/style/app_text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class NewPostModal extends StatelessWidget {
  const NewPostModal({super.key});

  @override
  Widget build(BuildContext context) {
    final appRepo = context.watch<AppRepo>();
    final postProvider = context.read<PostProvider>();
    final token = appRepo.token!;
    final user = appRepo.user!;
    final tfFocus = FocusNode();

    return GestureDetector(
      onTap: () => tfFocus.unfocus(),
      child: Container(
        decoration: const BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            )),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Create Post',
                style: AppText.subtitle1,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            AppTextFieldExpandable(
              maxLines: 5,
              hint: 'Write post...',
              focusNode: tfFocus,
              onChange: (value) {
                postProvider.message = value;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Consumer<PostProvider>(
              builder: (context, value, child) {
                return GestureDetector(
                  onTap: () {
                    postProvider.pickImage(ImageSource.gallery);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16))),
                    width: 150,
                    height: 150,
                    child: value.imagePath == null || value.imagePath == ''
                        ? const Center(
                            child: Text('Upload from gallery'),
                          )
                        : Image.file(File(value.imagePath!)),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                postProvider.createPost(token, user).then((value) {
                  Future.delayed(const Duration(seconds: 1), () {
                    postProvider.emitNewPost();
                    Navigator.of(context).pop();
                  });
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.black),
              child: const Text('Create post'),
            )
          ],
        ),
      ),
    );
  }
}
