import './network_base_environmental.dart';
import './network_base_code.dart';
import './network_base.dart';

class NetworkBaseConfig {
  static final NetworkBaseConfig _instance = NetworkBaseConfig._internal();

  factory NetworkBaseConfig() => _instance;

  NetworkBaseConfig._internal();

  late NetworkBase config;

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  NetworkBase _getConfig(String environment) {
    switch (environment) {
      case NetworkBaseCode.development:
        return DevelopmentEnvironmental();
      case NetworkBaseCode.production:
        return ProductionEnvironmental();
      case NetworkBaseCode.testing:
        return TestingEnvironmental();
      case NetworkBaseCode.staging:
        return StagingEnvironmental();
      case NetworkBaseCode.local:
      default:
        return LocalEnvironmental();
    }
  }
}

void instanceUrl() {
  const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: NetworkBaseCode.development,
  );

  NetworkBaseConfig().initConfig(environment);
}
