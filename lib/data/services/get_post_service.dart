import 'package:flutter_full_course/data/model/post.dart';
import 'package:flutter_full_course/data/services/base_service.dart';

class GetPostService extends ServiceBase<List<Post>> {
  @override
  Future<List<Post>> call() async {
    final result = await get('post/get-posts');
    return List.generate(
      result['data'].length,
      (index) {
        return Post.fromJson(result['data'][index]);
      },
    );
  }
}
