import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pos_public/core/di/injection.config.dart';

final sl = GetIt.instance;

@InjectableInit()
void configureDependencies() => sl.init();
