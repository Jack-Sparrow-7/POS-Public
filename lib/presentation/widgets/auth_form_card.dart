import 'package:flutter/material.dart';
import 'package:pos_public/core/extensions/context_extensions.dart';
import 'package:pos_public/core/theme/app_colors.dart';

class AuthFormCard extends StatelessWidget {
  const AuthFormCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.all(
        context.responsiveValue(mobile: 24, tablet: 40, desktop: 40),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.surface,
        boxShadow: [
          const BoxShadow(color: AppColors.shadowSoft, blurRadius: 2),
          BoxShadow(
            offset: const Offset(0, 4.5),
            color: AppColors.shadowStrong,
            blurRadius: 13.75,
          ),
        ],
      ),
      child: child,
    );
  }
}
