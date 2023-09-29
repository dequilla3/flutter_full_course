import 'package:flutter/material.dart';
import 'package:flutter_full_course/components/post_item.dart';
import 'package:flutter_full_course/components/toolbar.dart';
import 'package:flutter_full_course/config/app_routes.dart';
import 'package:flutter_full_course/provider/post_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<PostProvider>().getPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ToolBar(title: 'TestFlutters', actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.nearbyPage);
              },
              icon: const Icon(Icons.location_on))
        ]),
        body: Consumer<PostProvider>(
          builder: (context, value, child) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return PostItem(
                    post: value.list[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    thickness: 1,
                    height: 24,
                  );
                },
                itemCount: value.list.length);
          },
        ));
  }
}
