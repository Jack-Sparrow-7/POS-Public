import 'package:flutter/widgets.dart';

class AppShadows {
  const AppShadows._();

  static const cardShadow = [
    BoxShadow(color: Color(0x0A14181F), blurRadius: 3, offset: Offset(0, 1)),
    BoxShadow(color: Color(0x0814181F), blurRadius: 12, offset: Offset(0, 4)),
  ];

  static const cardShadowHover = [
    BoxShadow(color: Color(0x0F14181F), blurRadius: 8, offset: Offset(0, 2)),
    BoxShadow(color: Color(0x0A14181F), blurRadius: 24, offset: Offset(0, 8)),
  ];

  static const searchShadow = [
    BoxShadow(color: Color(0x0F14181F), blurRadius: 12, offset: Offset(0, 2)),
  ];

  static const navShadow = [
    BoxShadow(color: Color(0x0F14181F), blurRadius: 16, offset: Offset(0, -2)),
  ];
}
