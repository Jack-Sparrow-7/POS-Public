import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pos_public/core/di/injection.dart';
import 'package:pos_public/core/router/app_router.dart';
import 'package:pos_public/core/theme/app_theme.dart';
import 'package:pos_public/blocs/auth/auth_bloc.dart';
import 'package:toastification/toastification.dart';

class PublicApp extends StatefulWidget {
  const PublicApp({super.key});

  @override
  State<PublicApp> createState() => _PublicAppState();
}

class _PublicAppState extends State<PublicApp> {
  late final AuthBloc _authBloc = sl<AuthBloc>()..add(AuthStarted());
  late final GoRouter _router = createRouter(_authBloc);

  @override
  void dispose() {
    _router.dispose();
    _authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider.value(value: _authBloc)],
      child: ToastificationWrapper(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: _router,
          theme: AppTheme.light,
        ),
      ),
    );
  }
}
