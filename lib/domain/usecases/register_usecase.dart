import 'package:pos_public/domain/Entities/user.dart';
import 'package:pos_public/domain/repositories/auth_repository.dart';

class RegisterUsecase {
  final AuthRepository repo;

  RegisterUsecase({required this.repo});

  Future<User> call({
    required String name,
    required String mobileNumber,
    required String email,
    required String password,
  }) {
    return repo.register(
      name: name,
      mobileNumber: mobileNumber,
      email: email,
      password: password,
    );
  }
}
