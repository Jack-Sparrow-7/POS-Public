// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MenuStore _$MenuStoreFromJson(Map<String, dynamic> json) => _MenuStore(
  id: json['id'] as String,
  name: json['name'] as String,
  onlineOrderingEnabled: json['onlineOrderingEnabled'] as bool,
);

Map<String, dynamic> _$MenuStoreToJson(_MenuStore instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'onlineOrderingEnabled': instance.onlineOrderingEnabled,
    };
