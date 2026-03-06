import 'package:flutter/material.dart';
import 'package:pos_public/core/theme/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.neutral,
      appBarTheme: AppBarThemeData(backgroundColor: AppColors.neutral),
      fontFamily: 'Manrope',
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        secondary: AppColors.accent,
        surface: AppColors.surface,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.cursor,
        selectionColor: AppColors.selection,
        selectionHandleColor: AppColors.cursor,
      ),
    );
  }
}
