// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pos_public/core/network/auth_interceptor.dart' as _i1047;
import 'package:pos_public/core/network/dio_client.dart' as _i648;
import 'package:pos_public/core/storage/secure_storage.dart' as _i494;
import 'package:pos_public/blocs/auth/auth_bloc.dart' as _i767;
import 'package:pos_public/repositories/auth_repository.dart'
    as _i285;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioClient = _$DioClient();
    gh.lazySingleton<_i494.SecureStorage>(() => _i494.SecureStorage());
    gh.lazySingleton<_i1047.AuthInterceptor>(
      () => _i1047.AuthInterceptor(storage: gh<_i494.SecureStorage>()),
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioClient.dio(gh<_i1047.AuthInterceptor>()),
    );
    gh.lazySingleton<_i285.AuthRepository>(
      () => _i285.AuthRepository(dio: gh<_i361.Dio>()),
    );
    gh.factory<_i767.AuthBloc>(
      () => _i767.AuthBloc(
        repository: gh<_i285.AuthRepository>(),
        secureStorage: gh<_i494.SecureStorage>(),
      ),
    );
    return this;
  }
}

class _$DioClient extends _i648.DioClient {}
