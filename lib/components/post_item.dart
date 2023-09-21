import 'package:flutter/material.dart';
import 'package:flutter_full_course/style/app_text.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key, required this.user});
  final String user;

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
              Text(
                user,
                style: AppText.subtitle13,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Image.asset('assets/temp/post1.jpg'),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Don’t waste your life regretting the things you haven’t done. Do the things you want. 😄❤️',
            style: AppText.body1,
          ),
        ],
      ),
    );
  }
}
