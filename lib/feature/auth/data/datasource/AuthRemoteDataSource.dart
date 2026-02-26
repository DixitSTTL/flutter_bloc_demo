import 'package:dio/dio.dart';

import '../models/LoginDataModel.dart';

class AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSource(this.dio);

  Future<LoginDataModel> login(String email, String password) async {
    final response = await dio.post(
      'auth/login',
      data: {'username': email, 'password': password},
    );

    return LoginDataModel.fromJson(response.data);
  }
}
