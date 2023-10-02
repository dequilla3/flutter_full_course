import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_full_course/components/app_text_field.dart';
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
    return Container(
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
          const Text(
            'Insert Message',
            style: AppText.header1,
          ),
          const SizedBox(
            height: 16,
          ),
          AppTextField(
            hint: 'Message',
            onChange: (value) {
              context.read<PostProvider>().message = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          Consumer<PostProvider>(
            builder: (context, value, child) {
              return GestureDetector(
                onTap: () {
                  context.read<PostProvider>().pickImage(ImageSource.gallery);
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16))),
                  width: 200,
                  height: 200,
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
          const Text("OR"),
          const SizedBox(
            height: 16,
          ),
          OutlinedButton(onPressed: () {}, child: const Text('Camera')),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () {
              final token = context.read<AppRepo>().token!;
              final user = context.read<AppRepo>().user!;
              context
                  .read<PostProvider>()
                  .createPost(token, user)
                  .then((value) {
                Navigator.of(context).pop();
              });
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.black),
            child: const Text('Create post'),
          )
        ],
      ),
    );
  }
}
