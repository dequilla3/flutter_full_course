import 'package:flutter/material.dart';
import 'package:flutter_full_course/data/model/post.dart';
import 'package:flutter_full_course/data/services/get_post_service.dart';

class PostProvider extends ChangeNotifier {
  final List<Post> list = [];
  getPost() async {
    list.clear();
    list.addAll(await GetPostService().call());
    notifyListeners();
  }
}
