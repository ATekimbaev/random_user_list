import 'package:dio/dio.dart';
import 'package:random_user_12_00/model.dart';

class GetUsersRepo {
  final Dio dio;

  GetUsersRepo({required this.dio});

  Future getUsersList({required int count, required String? gender}) async {
    final response = await dio.get(
      '',
      queryParameters: {'results': count, 'gender': gender},
    );

    return UsersModelList.fromJson(response.data);
  }
}
