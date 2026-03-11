import 'package:flutter/material.dart';
import 'package:pos_public/core/theme/app_colors.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AppTheme {
  const AppTheme._();

  static ShadThemeData light = ShadThemeData(
    brightness: Brightness.light,

    colorScheme: const ShadColorScheme(
      background: AppColors.background,
      foreground: AppColors.foreground,

      card: AppColors.card,
      cardForeground: AppColors.cardForeground,

      popover: AppColors.popover,
      popoverForeground: AppColors.popoverForeground,

      primary: AppColors.primary,
      primaryForeground: AppColors.primaryForeground,

      secondary: AppColors.secondary,
      secondaryForeground: AppColors.secondaryForeground,

      muted: AppColors.muted,
      mutedForeground: AppColors.mutedForeground,

      accent: AppColors.accent,
      accentForeground: AppColors.accentForeground,

      destructive: AppColors.destructive,
      destructiveForeground: AppColors.destructiveForeground,

      border: AppColors.border,
      input: AppColors.input,
      ring: AppColors.ring,

      selection: AppColors.selection,
    ),

    radius: .circular(16),

    textTheme: ShadTextTheme(family: 'Inter'),
  );
}
