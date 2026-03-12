import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:dio/browser.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_public/core/network/api_endpoints.dart';
import 'package:pos_public/core/network/auth_interceptor.dart';

@module
abstract class DioClient {
  @lazySingleton
  Dio dio(AuthInterceptor authInterceptor) {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: const {'Content-Type': 'application/json'},
      ),
    );

    if (kIsWeb) {
      dio.httpClientAdapter = BrowserHttpClientAdapter()..withCredentials = true;
    }

    dio.interceptors.add(authInterceptor);
    return dio;
  }
}
