import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_category.freezed.dart';
part 'menu_category.g.dart';

@freezed
abstract class MenuCategory with _$MenuCategory {
  const factory MenuCategory({
    required String id,
    required String name,
    String? imageUrl,
  }) = _MenuCategory;

  factory MenuCategory.fromJson(Map<String, Object?> json) =>
      _$MenuCategoryFromJson(json);
}
