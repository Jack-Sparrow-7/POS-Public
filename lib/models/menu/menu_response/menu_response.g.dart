// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MenuResponse _$MenuResponseFromJson(Map<String, dynamic> json) =>
    _MenuResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      data: MenuData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MenuResponseToJson(_MenuResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_MenuData _$MenuDataFromJson(Map<String, dynamic> json) => _MenuData(
  store: MenuStore.fromJson(json['store'] as Map<String, dynamic>),
  categories: (json['categories'] as List<dynamic>)
      .map((e) => MenuCategory.fromJson(e as Map<String, dynamic>))
      .toList(),
  products: (json['products'] as List<dynamic>)
      .map((e) => MenuProduct.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MenuDataToJson(_MenuData instance) => <String, dynamic>{
  'store': instance.store,
  'categories': instance.categories,
  'products': instance.products,
};
