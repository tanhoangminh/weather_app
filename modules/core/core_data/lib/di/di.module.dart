//@GeneratedMicroModule;CoreDataPackageModule;package:core_data/di/di.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:core_data/di/module.dart' as _i8;
import 'package:core_data/src/app_config/app_config.dart' as _i6;
import 'package:core_data/src/cache/cache.dart' as _i5;
import 'package:core_data/src/environment/environment.dart' as _i3;
import 'package:core_dependency/core_dependency.dart' as _i7;
import 'package:core_router/core_router.dart' as _i4;
import 'package:injectable/injectable.dart' as _i1;

class CoreDataPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    final dIModule = _$DIModule();
    gh.singleton<_i3.AppEnvironment>(dIModule.flashEnvironment);
    gh.lazySingleton<_i4.AppRouter>(() => dIModule.appRouter);
    gh.lazySingleton<_i5.CacheBehavior>(() => dIModule.cache);
    gh.singleton<_i6.AppConfig>(dIModule.appConfig(gh<_i3.AppEnvironment>()));
    gh.lazySingleton<_i7.Dio>(() => dIModule.dio(gh<_i6.AppConfig>()));
  }
}

class _$DIModule extends _i8.DIModule {}
