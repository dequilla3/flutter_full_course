import 'package:flutter/material.dart';
import 'package:flutter_full_course/components/post_item.dart';
import 'package:flutter_full_course/components/toolbar.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  List<String> users = [];

  @override
  Widget build(Object context) {
    mockUsersFromServer();
    return Scaffold(
        appBar: const ToolBar(
            title: 'TestFlutters', actions: [Icon(Icons.location_on)]),
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
    for (var i = 0; i < 10; i++) {
      users.add('User number $i');
    }
  }
}
