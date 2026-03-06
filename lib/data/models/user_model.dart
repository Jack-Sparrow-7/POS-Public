import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pos_public/domain/Entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel implements User {
  const factory UserModel({
    required String id,
    required String name,
    required String mobileNumber,
    required String email,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
