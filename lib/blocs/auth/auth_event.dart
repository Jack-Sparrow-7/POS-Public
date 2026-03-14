part of 'auth_bloc.dart';

sealed class AuthEvent {}

class AuthStarted extends AuthEvent{}

class RegisterRequested extends AuthEvent {
  final String name;
  final String mobileNumber;
  final String email;
  final String password;

  RegisterRequested({
    required this.name,
    required this.mobileNumber,
    required this.email,
    required this.password,
  });
}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  LoginRequested({required this.email, required this.password});
}

class LogoutRequested extends AuthEvent {}
