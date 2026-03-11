import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_public/core/network/api_endpoints.dart';
import 'package:pos_public/core/storage/secure_storage.dart';

@lazySingleton
class AuthInterceptor extends Interceptor {
  static const _authPaths = {
    ApiEndpoints.login,
    ApiEndpoints.register,
  };

  final SecureStorage storage;

  AuthInterceptor({required this.storage});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_authPaths.contains(options.path)) {
      handler.next(options);
      return;
    }

    final token = await storage.getToken();

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }
}
