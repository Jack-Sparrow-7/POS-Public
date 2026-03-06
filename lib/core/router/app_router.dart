import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:pos_public/presentation/bloc/auth/auth_bloc.dart';
import 'package:pos_public/presentation/bloc/auth/auth_state.dart';
import 'package:pos_public/presentation/screens/auth_loading_screen.dart';
import 'package:pos_public/presentation/screens/forgot_password_screen.dart';
import 'package:pos_public/presentation/screens/home_screen.dart';
import 'package:pos_public/presentation/screens/login_screen.dart';
import 'package:pos_public/presentation/screens/register_screen.dart';

GoRouter createAppRouter(AuthBloc authBloc) {
  return GoRouter(
    initialLocation: '/',
    refreshListenable: AuthRefreshListenable(authBloc.stream),
    redirect: (context, state) {
      final authState = authBloc.state;
      final authRoutes = ['/register', '/login', '/forgotPassword'];
      final isAuthRoute = authRoutes.contains(state.matchedLocation);
      final isOnLoadingRoute = state.matchedLocation == '/';

      final isInitialCheck =
          authState is AuthInitial || authState is AuthChecking;
      final isAuthenticated = authState is AuthAuthenticated;

      if (isInitialCheck) return '/';
      if (isAuthenticated && (isAuthRoute || isOnLoadingRoute)) {
        return '/home';
      }
      if (!isAuthenticated && !isAuthRoute) return '/register';
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const AuthLoadingScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/forgotPassword',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    ],
  );
}

class AuthRefreshListenable extends ChangeNotifier {
  final Stream<dynamic> _stream;
  StreamSubscription<dynamic>? _subscription;

  AuthRefreshListenable(this._stream) {
    _subscription = _stream.asBroadcastStream().listen((_) {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
