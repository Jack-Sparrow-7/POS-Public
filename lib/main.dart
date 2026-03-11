import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pos_public/core/di/injection.dart';
import 'package:pos_public/public_app.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  configureDependencies();
  if (kIsWeb) {
    setUrlStrategy(PathUrlStrategy());
  }
  runApp(const PublicApp());
}
