import 'package:flutter/material.dart';
import 'package:flutter_full_course/data/model/post.dart';
import 'package:flutter_full_course/data/model/user_model.dart';
import 'package:flutter_full_course/data/services/create_post_service.dart';
import 'package:flutter_full_course/data/services/get_post_service.dart';
import 'package:flutter_full_course/data/services/socket_service.dart';
import 'package:flutter_full_course/data/services/upload_service.dart';
import 'package:flutter_full_course/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class PostProvider extends ChangeNotifier {
  final List<Post> list = [];
  String message = '';
  String? imagePath;
  String? token;
  IO.Socket? socket;

  setToken(String? token) {
    this.token = token;
    initSocket();
  }

  initSocket() {
    socket = SocketService().initSocket();

    socket?.on('onPost', (data) {
      getPost();
      notifyListeners();
    });
  }

  emitNewPost() {
    socket?.emit('newPost', 'NEWPOST');
  }

  // O(n2)
  getPost() async {
    List<Post> posts = await GetPostService(token).call();
    List<int> postIds = [];

    //Store current ids
    for (var postFeed in list) {
      postIds.add(postFeed.id);
    }

    for (var post in posts) {
      if (!postIds.contains(post.id)) {
        list.add(post);
      }
    }
    notifyListeners();
  }

  Future<void> createPost(String token, UserModel user) async {
    String? image;
    if (imagePath != null && imagePath!.isNotEmpty) {
      image = await upload(token);
    }
    await CreatePostService(message, image, token, user).call();
    message = '';
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
