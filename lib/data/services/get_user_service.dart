import 'package:flutter_full_course/data/model/user_model.dart';
import 'package:flutter_full_course/data/services/base_service.dart';

class GetUserService extends ServiceBase<List<UserModel>> {
  final String? token;

  GetUserService(this.token);

  @override
  Future<List<UserModel>> call() async {
    final result = await get('user/getUsers', token);
    return List.generate(
      result['data'] != null ? result['data'].length : 0,
      (index) {
        return UserModel.fromJson(result['data'][index]);
      },
    );
  }
}
