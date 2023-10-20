import 'package:core_data/src/app_config/app_config.dart';
import 'package:core_data/src/app_config/dev_config.dart';
import 'package:core_data/src/app_config/production_config.dart';
import 'package:core_data/src/cache/cache.dart';
import 'package:core_data/src/environment/environment.dart';
import 'package:core_data/src/network/logger.dart';
import 'package:core_dependency/core_dependency.dart';
import 'package:core_router/core_router.dart';

@module
abstract class DIModule {
  @lazySingleton
  AppRouter get appRouter => AppRouterImpl();

  @singleton
  AppEnvironment get flashEnvironment => AppEnvironment.instance;

  @lazySingleton
  CacheBehavior get cache => Cache();

  @lazySingleton
  Dio dio(AppConfig appConfig) {
    final dio = Dio(
      BaseOptions(
        baseUrl: appConfig.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'key': appConfig.apiKey},
      ),
    );

    final prettyDioLogger = NetworkLogger(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
      maxWidth: 80,
    );

    dio.interceptors.add(prettyDioLogger);
    return dio;
  }

  @singleton
  AppConfig appConfig(AppEnvironment env) {
    AppConfig config;
    switch (env.flavor) {
      case AppFlavor.dev:
        config = DevConfig();
        break;
      case AppFlavor.production:
        config = ProductionConfig();
        break;
      default:
        throw UnimplementedError();
    }
    return config;
  }
}
