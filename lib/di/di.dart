import 'package:core_data/core_data.dart';
import 'package:core_dependency/core_dependency.dart';
import 'di.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true, // default
  externalPackageModules: [CoreDataPackageModule],
  ignoreUnregisteredTypes: [Dio, Cache],
)
Future configureDependencies() => getIt.init();
