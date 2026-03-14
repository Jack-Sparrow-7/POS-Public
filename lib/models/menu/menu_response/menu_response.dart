import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pos_public/models/menu/menu_category/menu_category.dart';
import 'package:pos_public/models/menu/menu_product/menu_product.dart';
import 'package:pos_public/models/menu/menu_store/menu_store.dart';

part 'menu_response.freezed.dart';
part 'menu_response.g.dart';

@freezed
abstract class MenuResponse with _$MenuResponse {
  const factory MenuResponse({
    required String status,
    required String message,
    required MenuData data,
  }) = _MenuResponse;

  factory MenuResponse.fromJson(Map<String, Object?> json) =>
      _$MenuResponseFromJson(json);
}

@freezed
abstract class MenuData with _$MenuData {
  const factory MenuData({
    required MenuStore store,
    required List<MenuCategory> categories,
    required List<MenuProduct> products,
  }) = _MenuData;

  factory MenuData.fromJson(Map<String, Object?> json) =>
      _$MenuDataFromJson(json);
}
