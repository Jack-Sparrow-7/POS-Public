import 'package:pos_public/data/data_sources/auth_data_source.dart';
import 'package:pos_public/domain/Entities/user.dart';
import 'package:pos_public/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<User?> getCurrentUser() {
    return dataSource.getCurrentUser();
  }

  @override
  Future<User> login({required String email, required String password}) {
    return dataSource.login(email: email, password: password);
  }

  @override
  Future<void> logout() {
    return dataSource.logout();
  }

  @override
  Future<User> register({
    required String name,
    required String mobileNumber,
    required String email,
    required String password,
  }) {
    return dataSource.register(
      email: email,
      name: name,
      mobileNumber: mobileNumber,
      password: password,
    );
  }
}
