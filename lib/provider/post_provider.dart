import 'package:flutter/material.dart';
import 'package:flutter_full_course/data/model/post.dart';
import 'package:flutter_full_course/data/model/user_model.dart';
import 'package:flutter_full_course/data/services/create_post_service.dart';
import 'package:flutter_full_course/data/services/get_post_service.dart';
import 'package:flutter_full_course/data/services/upload_service.dart';
import 'package:flutter_full_course/utils/utils.dart';
import 'package:image_picker/image_picker.dart';

class PostProvider extends ChangeNotifier {
  final List<Post> list = [];
  String message = '';
  String? imagePath;
  String? token;

  setToken(String? token) {
    this.token = token;
  }

  getPost() async {
    list.clear();
    list.addAll(await GetPostService(token).call());
    notifyListeners();
  }

  Future<void> createPost(String token, UserModel user) async {
    String? image;
    if (imagePath != null) {
      image = await upload(token);
    }
    await CreatePostService(message, image, token, user).call();
    message = '';
    getPost();
  }

  Future<String> upload(String token) async {
    return await UploadService(imagePath!, token).call();
  }

  pickImage(ImageSource source) async {
    try {
      final path = await Utils.pickImage(source);
      imagePath = path;
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }
}
