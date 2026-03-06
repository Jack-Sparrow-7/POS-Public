import 'package:pos_public/domain/Entities/user.dart';

abstract class AuthRepository {
  Future<User> login({required String email, required String password});

  Future<void> logout();

  Future<User> register({
    required String name,
    required String mobileNumber,
    required String email,
    required String password,
  });

  Future<User?> getCurrentUser();
}
