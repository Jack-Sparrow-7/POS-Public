import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:pos_public/views/screens/home_screen.dart';
import 'package:pos_public/views/screens/loading_screen.dart';
import 'package:pos_public/blocs/auth/auth_bloc.dart';
import 'package:pos_public/views/screens/forgot_password_screen.dart';
import 'package:pos_public/views/screens/login_screen.dart';
import 'package:pos_public/views/screens/register_screen.dart';

GoRouter createRouter(AuthBloc authBloc) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => LoadingScreen()),
      GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
      GoRoute(path: '/register', builder: (context, state) => RegisterScreen()),
      GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
      GoRoute(
        path: '/forgotPassword',
        builder: (context, state) => ForgotPasswordScreen(),
      ),
    ],
    redirect: (context, state) {
      final authRoutes = ['/login', '/register', '/forgotPassword'];
      final protectedRoutes = ['/home'];
      final isOnLoadingRoute = state.matchedLocation == '/';
      final isAuthRoute = authRoutes.contains(state.matchedLocation);
      final isProtectedRoute = protectedRoutes.contains(state.matchedLocation);

      final authState = authBloc.state;

      if (authState is AuthInitial) {
        return '/';
      }

      if (authState is Unauthenticated) {
        if (isProtectedRoute || isOnLoadingRoute) {
          return '/login';
        }
        return null;
      }

      if (authState is Authenticated) {
        if (isAuthRoute || isOnLoadingRoute) {
          return '/home';
        }
        return null;
      }

      if (isProtectedRoute) {
        return '/login';
      }

      return null;
    },
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription _subscription;

  GoRouterRefreshStream(Stream stream) {
    notifyListeners();

    _subscription = stream.asBroadcastStream().listen(
      (event) => notifyListeners(),
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
