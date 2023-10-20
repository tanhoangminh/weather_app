import 'package:core_dependency/core_dependency.dart';

import 'app_config.dart';

part 'dev_config.g.dart';

@Envied(path: '.dev.env')
class DevConfig extends AppConfig {
  @override
  @EnviedField(varName: 'baseUrl', obfuscate: true)
  final String baseUrl = _DevConfig.baseUrl;

  @override
  @EnviedField(varName: 'apiKey', obfuscate: true)
  final String apiKey = _DevConfig.apiKey;

  @override
  @EnviedField(varName: 'encryptionKey', obfuscate: true)
  final String encryptionKey = _DevConfig.encryptionKey;
}
