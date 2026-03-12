import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SecureStorage {
  static const _storage = FlutterSecureStorage();

  static const _tokenKey = "access_token";
  static const _refreshTokenKey = "refresh_token";

  Future<void> saveTokens({
    required String token,
    required String refreshToken,
  }) async {
    if (kIsWeb) return;
    await _storage.write(key: _tokenKey, value: token);
    await _storage.write(key: _refreshTokenKey, value: refreshToken);
  }

  Future<String?> getToken() async {
    if (kIsWeb) return null;
    return await _storage.read(key: _tokenKey);
  }

  Future<String?> getRefreshToken() async {
    if (kIsWeb) return null;
    return await _storage.read(key: _refreshTokenKey);
  }

  Future<void> clear() async {
    if (kIsWeb) return;
    await _storage.delete(key: _tokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }
}
