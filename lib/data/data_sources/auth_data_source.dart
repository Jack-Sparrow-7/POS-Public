import 'package:dio/dio.dart';
import 'package:pos_public/core/constants/api_endpoints.dart';
import 'package:pos_public/data/models/user_model.dart';

class AuthDataSource {
  final Dio dio;

  AuthDataSource({required this.dio});

  Future<UserModel> register({
    required String email,
    required String name,
    required String mobileNumber,
    required String password,
  }) async {
    final res = await dio.post(
      ApiEndpoints.customerRegister,
      data: {
        'name': name,
        'email': email,
        'mobileNumber': mobileNumber,
        'password': password,
      },
    );
    return UserModel.fromJson(res.data['user']);
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final res = await dio.post(
      ApiEndpoints.customerLogin,
      data: {'email': email, 'password': password},
    );
    return UserModel.fromJson(res.data['user']);
  }

  Future<UserModel?> getCurrentUser() async {
    final res = await dio.get(ApiEndpoints.customerCurrentUser);
    return UserModel.fromJson(res.data['user']);
  }

  Future<void> logout() async {
    await dio.post(ApiEndpoints.customerLogout);
  }
}
