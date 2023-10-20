import 'package:flutter/material.dart';
import 'package:flutter_full_course/components/post_item.dart';
import 'package:flutter_full_course/components/toolbar.dart';
import 'package:flutter_full_course/config/app_routes.dart';
import 'package:flutter_full_course/provider/app_repo.dart';
import 'package:flutter_full_course/provider/post_provider.dart';
import 'package:flutter_full_course/style/app_colors.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController? scrollController;
  bool isTap = false;
  int tappedIndex = 0;

  Future<void> _loadPost() async {
    context.read<PostProvider>().setToken(context.read<AppRepo>().token);
    context.read<PostProvider>().getPost();
  }

  onTap(int index) {
    setState(() {
      isTap = true;
      tappedIndex = index;
    });

    Future.delayed(
      const Duration(milliseconds: 100),
      () {
        setState(() {
          isTap = false;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()..addListener(_scrollListener);
    _loadPost();
  }

  @override
  void dispose() {
    scrollController?.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (scrollController!.position.extentAfter < 500) {
      _loadPost();
    }
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
        body: RefreshIndicator(
          onRefresh: () {
            return _loadPost();
          },
          child: Consumer<PostProvider>(
            builder: (context, value, child) {
              return ListView.separated(
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => onTap(index),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isTap && index == tappedIndex
                              ? AppColors.primary.withOpacity(0.1)
                              : Colors.transparent,
                        ),
                        child: PostItem(
                          post: value.list[index],
                        ),
                      ),
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
          ),
        ));
  }
}
