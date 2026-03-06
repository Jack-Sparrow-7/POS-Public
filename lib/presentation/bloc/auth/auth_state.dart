import 'package:pos_public/domain/Entities/user.dart';

abstract class AuthState {
  final User? user;
  final String? message;

  const AuthState({this.user, this.message});
}

class AuthInitial extends AuthState {
  const AuthInitial() : super();
}

class AuthChecking extends AuthState {
  const AuthChecking() : super();
}

class AuthLoading extends AuthState {
  const AuthLoading({super.user});
}

class AuthAuthenticated extends AuthState {
  const AuthAuthenticated(User user) : super(user: user);
}

class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated() : super();
}

class AuthFailure extends AuthState {
  const AuthFailure(String message, {super.user}) : super(message: message);
}
