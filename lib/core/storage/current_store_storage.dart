import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class CurrentStoreStorage {
  static const _storeIdKey = 'storeId';

  final SharedPreferencesAsync _prefs = SharedPreferencesAsync();

  Future<void> saveStoreId(String storeId) =>
      _prefs.setString(_storeIdKey, storeId);

  Future<String?> getStoreId() => _prefs.getString(_storeIdKey);

  Future<void> clearStoreId() => _prefs.remove(_storeIdKey);
}
