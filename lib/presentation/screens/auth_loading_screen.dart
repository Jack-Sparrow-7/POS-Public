import 'package:flutter/material.dart';
import 'package:pos_public/core/theme/app_colors.dart';

class AuthLoadingScreen extends StatelessWidget {
  const AuthLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.neutral,
      body: Center(child: CircularProgressIndicator(color: AppColors.primary)),
    );
  }
}
