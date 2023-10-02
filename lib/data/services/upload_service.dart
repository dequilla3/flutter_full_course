import 'package:flutter_full_course/data/services/base_service.dart';

class UploadService extends ServiceBase<String> {
  final String path;
  final String token;

  UploadService(this.path, this.token);

  @override
  Future<String> call() async {
    final result = await upload('post/upload', 'jpeg', path, token);
    return result['path'];
  }
}
