import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_store.freezed.dart';
part 'menu_store.g.dart';

@freezed
abstract class MenuStore with _$MenuStore {
  const factory MenuStore({
    required String id,
    required String name,
    required bool onlineOrderingEnabled,
  }) = _MenuStore;

  factory MenuStore.fromJson(Map<String, Object?> json) =>
      _$MenuStoreFromJson(json);
}
