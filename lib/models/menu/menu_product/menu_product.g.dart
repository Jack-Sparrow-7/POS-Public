// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MenuProduct _$MenuProductFromJson(Map<String, dynamic> json) => _MenuProduct(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  price: (json['price'] as num).toInt(),
  imageUrl: json['imageUrl'] as String?,
  categoryId: json['categoryId'] as String,
  isAvailable: json['isAvailable'] as bool,
);

Map<String, dynamic> _$MenuProductToJson(_MenuProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
      'categoryId': instance.categoryId,
      'isAvailable': instance.isAvailable,
    };
