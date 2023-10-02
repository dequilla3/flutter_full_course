import 'package:flutter_full_course/data/model/post.dart';
import 'package:flutter_full_course/data/services/base_service.dart';

class GetPostService extends ServiceBase<List<Post>> {
  final String? token;

  GetPostService(this.token);

  @override
  Future<List<Post>> call() async {
    final result = await get('post/get-posts', token);
    return List.generate(
      result['data'] != null ? result['data'].length : 0,
      (index) {
        return Post.fromJson(result['data'][index]);
      },
    );
  }
}
