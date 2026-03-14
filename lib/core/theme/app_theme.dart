import 'package:flutter/material.dart';
import 'package:pos_public/core/theme/app_colors.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData light = ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.background,
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.primaryForeground,
      secondary: AppColors.secondary,
      onSecondary: AppColors.secondaryForeground,
      error: AppColors.destructive,
      onError: AppColors.destructiveForeground,
      surface: AppColors.card,
      onSurface: AppColors.cardForeground,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.muted,
      hintStyle: const TextStyle(color: AppColors.mutedForeground),
      prefixIconColor: AppColors.mutedForeground,
      suffixIconColor: AppColors.mutedForeground,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: AppColors.ring),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primary,
      selectionColor: AppColors.selection,
      selectionHandleColor: AppColors.primary,
    ),
  );
}
