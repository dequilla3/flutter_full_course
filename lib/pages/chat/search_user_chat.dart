import 'package:flutter/material.dart';
import 'package:flutter_full_course/components/toolbar.dart';
import 'package:flutter_full_course/components/user_avatar.dart';
import 'package:flutter_full_course/config/app_routes.dart';
import 'package:flutter_full_course/provider/app_repo.dart';
import 'package:provider/provider.dart';

class SearchUserChat extends StatelessWidget {
  const SearchUserChat({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AppRepo>().getUsers();
    return Scaffold(
      appBar: const ToolBar(
        typing: true,
      ),
      body: Consumer<AppRepo>(
        builder: (context, value, child) {
          return ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  context.read<AppRepo>().selectedUserToChat =
                      value.users[index];
                  Navigator.of(context).pushNamed(AppRoutes.chatPage);
                },
                leading: const UserAvatar(size: 35),
                title: Text(
                    '${value.users[index].firstname} ${value.users[index].lastname}'),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(thickness: 1, height: 24);
            },
            itemCount: value.users.length,
          );
        },
      ),
    );
  }
}
