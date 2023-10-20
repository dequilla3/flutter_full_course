import 'package:flutter/material.dart';
import 'package:flutter_full_course/data/model/chat.dart';
import 'package:flutter_full_course/data/model/user_model.dart';
import 'package:flutter_full_course/data/services/socket_service.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class AppRepo extends ChangeNotifier {
  String? _token;
  UserModel? user;
  List<Chat> chats = [];
  IO.Socket? socket;

  set token(String? value) {
    _token = value;
    initSocket();
  }

  String? get token => _token;

  initSocket() {
    socket = SocketService().initSocket();

    socket?.on('onMessage', (data) {
      chats.add(Chat.fromJson(data));
      notifyListeners();
    });
  }

  sendMessage(String? message) {
    if (message != null) {
      final msg = {'usrId': user?.id, 'msg': message};
      socket?.emit('newMessage', msg);
    }
  }
}
