import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pos_public/models/user/user.dart';

part 'auth_response.freezed.dart';
part 'auth_response.g.dart';

@freezed
abstract class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    required String status,
    required User user,
    required String token,
    required String refreshToken,
    required String message,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}
