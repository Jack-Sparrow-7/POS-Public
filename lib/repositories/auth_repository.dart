import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_public/core/network/api_endpoints.dart';
import 'package:pos_public/models/auth_response/auth_response.dart';
import 'package:pos_public/models/user/user.dart';

@lazySingleton
class AuthRepository {
  final Dio dio;

  AuthRepository({required this.dio});

  Future<AuthResponse> register({
    required String name,
    required String mobileNumber,
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        ApiEndpoints.register,
        data: {
          "name": name,
          "mobileNumber": mobileNumber,
          "email": email,
          "password": password,
        },
      );

      return AuthResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data["message"] ?? "Register failed");
    }
  }

  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        ApiEndpoints.login,
        data: {"email": email, "password": password},
      );

      return AuthResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data["message"] ?? "Login failed");
    }
  }

  Future<User> getUser() async {
    try {
      final response = await dio.get(ApiEndpoints.currentUser);

      return User.fromJson(response.data["user"]);
    } on DioException catch (e) {
      throw Exception(e.response?.data["message"] ?? "Failed to fetch user");
    }
  }

  Future<void> logout() async {
    try {
      await dio.get(ApiEndpoints.logout);
    } on DioException catch (e) {
      throw Exception(e.response?.data?["message"] ?? "Logout failed");
    }
  }
}
