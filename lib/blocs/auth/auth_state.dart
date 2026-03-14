part of 'auth_bloc.dart';

sealed class AuthState {}

enum AuthLoadingAction { login, register, logout }

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {
  final AuthLoadingAction action;

  AuthLoading({required this.action});
}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}

class Authenticated extends AuthState {
  final User user;

  Authenticated({required this.user});
}

class Unauthenticated extends AuthState{}
