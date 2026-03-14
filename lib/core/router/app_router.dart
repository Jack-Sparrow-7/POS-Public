import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:pos_public/blocs/auth/auth_bloc.dart';
import 'package:pos_public/core/storage/current_store_storage.dart';
import 'package:pos_public/views/screens/forgot_password_screen.dart';
import 'package:pos_public/views/screens/home_screen.dart';
import 'package:pos_public/views/screens/loading_screen.dart';
import 'package:pos_public/views/screens/login_screen.dart';
import 'package:pos_public/views/screens/register_screen.dart';
import 'package:pos_public/views/screens/select_store_screen.dart';

GoRouter createRouter(
  AuthBloc authBloc,
  CurrentStoreStorage currentStoreStorage,
) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => LoadingScreen()),
      GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
      GoRoute(path: '/register', builder: (context, state) => RegisterScreen()),
      GoRoute(
        path: '/home/:storeId',
        builder: (context, state) =>
            HomeScreen(storeId: state.pathParameters['storeId']),
      ),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => ForgotPasswordScreen(),
      ),
      GoRoute(
        path: '/select-store',
        builder: (context, state) => SelectStoreScreen(),
      ),
    ],
    redirect: (context, state) async {
      final authRoutes = ['/login', '/register', '/forgot-password'];
      final isOnLoadingRoute = state.matchedLocation == '/';
      final isAuthRoute = authRoutes.contains(state.matchedLocation);

      final authState = authBloc.state;

      if (authState is AuthInitial) {
        return '/';
      }

      final savedStoreId = await currentStoreStorage.getStoreId();
      final isSelectStoreRoute = state.matchedLocation == '/select-store';
      final homeLocation = savedStoreId == null
          ? '/select-store'
          : '/home/$savedStoreId';

      if (authState is Unauthenticated) {
        if (isOnLoadingRoute) {
          return homeLocation;
        }
        if (isSelectStoreRoute && savedStoreId != null) {
          return homeLocation;
        }
        return null;
      }

      if (authState is Authenticated) {
        if (isOnLoadingRoute || isAuthRoute) {
          return homeLocation;
        }
        if (isSelectStoreRoute && savedStoreId != null) {
          return homeLocation;
        }
        return null;
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
