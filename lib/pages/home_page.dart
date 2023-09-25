import 'package:flutter/material.dart';
import 'package:flutter_full_course/components/post_item.dart';
import 'package:flutter_full_course/components/toolbar.dart';
import 'package:flutter_full_course/config/app_routes.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  List<String> users = [];

  @override
  Widget build(BuildContext context) {
    mockUsersFromServer();
    return Scaffold(
        appBar: ToolBar(title: 'TestFlutters', actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.nearbyPage);
              },
              icon: const Icon(Icons.location_on))
        ]),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return PostItem(user: users[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                thickness: 1,
                height: 24,
              );
            },
            itemCount: users.length));
  }

  mockUsersFromServer() {
    for (var i = 0; i < 2; i++) {
      users.add('User number $i');
    }
  }
}
