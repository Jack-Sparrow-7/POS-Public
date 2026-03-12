import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_public/core/storage/secure_storage.dart';
import 'package:pos_public/models/user/user.dart';
import 'package:pos_public/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  String _errorMessage(Object error) {
    final message = error.toString();
    return message.startsWith('Exception: ')
        ? message.replaceFirst('Exception: ', '')
        : message;
  }

  final AuthRepository repository;
  final SecureStorage secureStorage;

  AuthBloc({required this.repository, required this.secureStorage})
    : super(AuthInitial()) {
    on<AuthStarted>(_onStarted);
    on<LoginRequested>(_onLogin);
    on<RegisterRequested>(_onRegister);
    on<LogoutRequested>(_onLogout);
  }

  Future<void> _onStarted(AuthStarted event, Emitter<AuthState> emit) async {
    emit(AuthInitial());

    try {
      final user = await repository.getUser();
      emit(Authenticated(user: user));
    } catch (_) {
      await secureStorage.clear();
      emit(Unauthenticated());
    }
  }

  Future<void> _onLogin(LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final response = await repository.login(
        email: event.email,
        password: event.password,
      );

      await secureStorage.saveTokens(
        token: response.token,
        refreshToken: response.refreshToken,
      );

      emit(Authenticated(user: response.user));
    } catch (e) {
      emit(AuthError(message: _errorMessage(e)));
    }
  }

  Future<void> _onRegister(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final response = await repository.register(
        name: event.name,
        mobileNumber: event.mobileNumber,
        email: event.email,
        password: event.password,
      );

      await secureStorage.saveTokens(
        token: response.token,
        refreshToken: response.refreshToken,
      );

      emit(Authenticated(user: response.user));
    } catch (e) {
      emit(AuthError(message: _errorMessage(e)));
    }
  }

  Future<void> _onLogout(LogoutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      await repository.logout();
    } catch (_) {}

    await secureStorage.clear();
    emit(Unauthenticated());
  }
}
