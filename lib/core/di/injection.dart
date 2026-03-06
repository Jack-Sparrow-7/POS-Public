import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pos_public/data/data_sources/auth_data_source.dart';
import 'package:pos_public/data/repositories/auth_repository_impl.dart';
import 'package:pos_public/domain/repositories/auth_repository.dart';
import 'package:pos_public/domain/usecases/login_usecase.dart';
import 'package:pos_public/domain/usecases/register_usecase.dart';
import 'package:pos_public/presentation/bloc/auth/auth_bloc.dart';

final sl = GetIt.instance;

void configureDependencies() {
  if (sl.isRegistered<Dio>()) return;

  const envBaseUrl = String.fromEnvironment('API_BASE_URL');
  final configuredBaseUrl = envBaseUrl.isNotEmpty
      ? envBaseUrl
      : 'http://192.168.31.103:8080';

  sl.registerLazySingleton<Dio>(() {
    final dio = Dio(
      BaseOptions(
        baseUrl: configuredBaseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.options.extra['withCredentials'] = true;

    return dio;
  });

  sl.registerLazySingleton<AuthDataSource>(() => AuthDataSource(dio: sl()));
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(dataSource: sl()),
  );
  sl.registerLazySingleton<LoginUsecase>(() => LoginUsecase(repo: sl()));
  sl.registerLazySingleton<RegisterUsecase>(() => RegisterUsecase(repo: sl()));

  sl.registerFactory<AuthBloc>(
    () => AuthBloc(
      loginUsecase: sl(),
      registerUsecase: sl(),
      authRepository: sl(),
    ),
  );
}
