import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_product.freezed.dart';
part 'menu_product.g.dart';

@freezed
abstract class MenuProduct with _$MenuProduct {
  const factory MenuProduct({
    required String id,
    required String name,
    String? description,
    required int price,
    String? imageUrl,
    required String categoryId,
    required bool isAvailable,
  }) = _MenuProduct;

  factory MenuProduct.fromJson(Map<String, Object?> json) =>
      _$MenuProductFromJson(json);
}
