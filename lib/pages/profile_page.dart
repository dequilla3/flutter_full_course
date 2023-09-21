import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_full_course/style/app_text.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Image.asset(
          'assets/temp/janedoe.jpg',
          width: 90,
          height: 90,
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          'Jane Doe',
          style: AppText.header2,
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          'New York',
          style: AppText.subtitle13,
        ),
        const SizedBox(
          height: 16,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  '11.1k',
                  style: AppText.header2,
                ),
                Text('Followers')
              ],
            ),
            Column(
              children: [
                Text(
                  '304',
                  style: AppText.header2,
                ),
                Text('Posts'),
              ],
            ),
            Column(
              children: [
                Text(
                  '113',
                  style: AppText.header2,
                ),
                Text('Following'),
              ],
            )
          ],
        ),
        const Divider(
          thickness: 1,
          height: 24,
        )
      ]),
    );
  }
}
