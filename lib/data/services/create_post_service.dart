import 'package:flutter_full_course/data/model/user_model.dart';
import 'package:flutter_full_course/data/services/base_service.dart';

class CreatePostService extends ServiceBase<void> {
  final String message;
  final String? image;
  final UserModel user;
  final String token;

  CreatePostService(this.message, this.image, this.token, this.user);

  @override
  Future<void> call() async {
    final body = {
      'message': message,
      'image': image ?? "",
      'userId': user.id.toString()
    };
    await post('post/add-post', body: body, token: token);
  }
}
