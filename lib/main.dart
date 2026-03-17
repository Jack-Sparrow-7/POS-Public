import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:pos_public/core/di/injection.dart';
import 'package:pos_public/public_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    setUrlStrategy(PathUrlStrategy());
  }

  configureDependencies();

  runApp(const PublicApp());
}
