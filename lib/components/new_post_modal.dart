import 'package:flutter/material.dart';
import 'package:flutter_full_course/components/app_text_field.dart';
import 'package:flutter_full_course/style/app_colors.dart';
import 'package:flutter_full_course/style/app_text.dart';

class NewPostModal extends StatelessWidget {
  NewPostModal({super.key});
  final msgController = TextEditingController();

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
          AppTextField(hint: 'Message', controller: msgController),
          const SizedBox(
            height: 16,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(16))),
            width: 200,
            height: 200,
            child: const Center(
              child: Text('Upload from gallery'),
            ),
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
            onPressed: () {},
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
