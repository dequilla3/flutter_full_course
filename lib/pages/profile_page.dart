import 'package:flutter/material.dart';
import 'package:flutter_full_course/components/toolbar.dart';
import 'package:flutter_full_course/components/user_avatar.dart';
import 'package:flutter_full_course/config/app_routes.dart';
import 'package:flutter_full_course/style/app_text.dart';

enum ProfileMenu { edit, logout }

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolBar(
        title: 'Profile',
        actions: [
          PopupMenuButton<ProfileMenu>(onSelected: (value) {
            switch (value) {
              case ProfileMenu.edit:
                Navigator.of(context).pushNamed(AppRoutes.editProfilePage);
                break;
              case ProfileMenu.logout:
                print('logout');
                break;
              default:
            }
          }, itemBuilder: (context) {
            return [
              const PopupMenuItem(
                value: ProfileMenu.edit,
                child: Row(children: [Icon(Icons.edit), Text('Edit')]),
              ),
              const PopupMenuItem(
                value: ProfileMenu.logout,
                child: Row(children: [Icon(Icons.logout), Text('Log out')]),
              ),
            ];
          })
        ],
      ),
      body: const Column(children: [
        UserAvatar(size: 90),
        SizedBox(
          height: 16,
        ),
        Text(
          'Jane Doe',
          style: AppText.header2,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'New York',
          style: AppText.subtitle13,
        ),
        SizedBox(
          height: 16,
        ),
        Row(
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
        Divider(
          thickness: 1,
          height: 24,
        )
      ]),
    );
  }
}
