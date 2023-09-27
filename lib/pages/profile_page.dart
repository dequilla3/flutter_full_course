import 'package:flutter/material.dart';
import 'package:flutter_full_course/components/toolbar.dart';
import 'package:flutter_full_course/components/user_avatar.dart';
import 'package:flutter_full_course/config/app_routes.dart';
import 'package:flutter_full_course/provider/app_repo.dart';
import 'package:flutter_full_course/style/app_text.dart';
import 'package:provider/provider.dart';

enum ProfileMenu { edit, logout }

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppRepo>(context).user;

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
                Navigator.of(context).pushNamed(AppRoutes.loginPage);
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
      body: Column(children: [
        const UserAvatar(size: 90),
        const SizedBox(
          height: 16,
        ),
        Text(
          '${user?.firstname} ${user?.lastname}',
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
