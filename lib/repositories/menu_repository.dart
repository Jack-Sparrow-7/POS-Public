import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_public/core/network/api_endpoints.dart';
import 'package:pos_public/models/menu/menu_response/menu_response.dart';

String? _readErrorMessage(DioException error) {
  final data = error.response?.data;
  return data is Map<String, dynamic> ? data['message'] as String? : null;
}

@lazySingleton
class MenuRepository {
  final Dio dio;

  MenuRepository({required this.dio});

  Future<MenuResponse> getMenu({required String storeId}) async {
    try {
      final response = await dio.get(ApiEndpoints.getMenu(storeId: storeId));

      return MenuResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(_readErrorMessage(e) ?? 'Failed to fetch menu');
    }
  }
}
