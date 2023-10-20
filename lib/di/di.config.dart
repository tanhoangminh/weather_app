// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core_data/core_data.dart' as _i3;
import 'package:core_dependency/core_dependency.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../src/home_bloc.dart' as _i4;
import '../src/info/data/data_source/weather_remote_data_source.dart' as _i9;
import '../src/info/data/repository/weather_service_impl.dart' as _i11;
import '../src/info/domain/weather_service.dart' as _i10;
import '../src/info/presentation/state/weather_bloc.dart' as _i13;
import '../src/search/data/data_source/search_remote_data_source.dart' as _i5;
import '../src/search/data/repository/search_service_impl.dart' as _i8;
import '../src/search/domain/search_service.dart' as _i7;
import '../src/search/presentation/state/search_bloc.dart' as _i12;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    await _i3.CoreDataPackageModule().init(gh);
    gh.factory<_i4.LocationManageBloc>(
        () => _i4.LocationManageBloc(gh<_i3.CacheBehavior>()));
    gh.lazySingleton<_i5.SearchRemoteDataSource>(
        () => _i5.SearchRemoteDataSource(gh<_i6.Dio>()));
    gh.factory<_i7.SearchService>(
        () => _i8.SearchServiceImpl(gh<_i5.SearchRemoteDataSource>()));
    gh.lazySingleton<_i9.WeatherRemoteDataSource>(
        () => _i9.WeatherRemoteDataSource(gh<_i6.Dio>()));
    gh.factory<_i10.WeatherService>(
        () => _i11.WeatherServiceImpl(gh<_i9.WeatherRemoteDataSource>()));
    gh.factory<_i12.SearchBloc>(() => _i12.SearchBloc(gh<_i7.SearchService>()));
    gh.factory<_i13.WeatherBloc>(
        () => _i13.WeatherBloc(gh<_i10.WeatherService>()));
    return this;
  }
}
