part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}

class Authenticated extends AuthState {
  final User user;

  Authenticated({required this.user});
}

class Unauthenticated extends AuthState{}
