import 'package:flutter/material.dart';
import 'package:flutter_full_course/components/toolbar.dart';
import 'package:flutter_full_course/config/app_routes.dart';

class ChatHomePage extends StatelessWidget {
  const ChatHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToolBar(title: 'Chat', actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.searchUserChat);
            },
            icon: const Icon(Icons.search))
      ]),
      body: Text('Chats'),
    );
  }
}
