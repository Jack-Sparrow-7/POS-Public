import 'package:flutter/material.dart';
import 'package:pos_public/core/theme/app_colors.dart';

class AppBreakpoints {
  static const double mobile = 600;
  static const double tablet = 1024;

  const AppBreakpoints._();
}

extension ContextScreenExtensions on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);
  double get screenWidth => screenSize.width;

  bool get isMobile => screenWidth < AppBreakpoints.mobile;
  bool get isTablet =>
      screenWidth >= AppBreakpoints.mobile &&
      screenWidth < AppBreakpoints.tablet;
  bool get isDesktop => screenWidth >= AppBreakpoints.tablet;

  T responsiveValue<T>({required T mobile, T? tablet, T? desktop}) {
    if (isDesktop) return desktop ?? tablet ?? mobile;
    if (isTablet) return tablet ?? mobile;
    return mobile;
  }
}

extension ContextSnackBarExtensions on BuildContext {
  ScaffoldMessengerState get _scaffoldMessenger => ScaffoldMessenger.of(this);

  void showErrorSnackBar(String message) {
    _scaffoldMessenger.clearSnackBars();
    _scaffoldMessenger.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.danger,
        duration: const Duration(seconds: 4),
      ),
    );
  }
}
