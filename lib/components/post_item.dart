import 'package:flutter/material.dart';
import 'package:flutter_full_course/config/app_config.dart';
import 'package:flutter_full_course/data/model/post.dart';
import 'package:flutter_full_course/style/app_text.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key, required this.post});
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/temp/janedoe.jpg',
                width: 40,
                height: 40,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '${post.owner?.firstname} ${post.owner?.lastname}',
                style: AppText.subtitle13,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '${post.message}',
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          post.image != ""
              ? Image.network('${AppConfig.baseUrl}${post.image}')
              : const SizedBox(),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
