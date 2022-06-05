import 'base_config.dart';
import 'dev_config.dart';
import 'prod_config.dart';
import 'staging_config.dart';

class Environment {
  static final Environment _instance = Environment._internal();

  factory Environment() {
    return _instance;
  }

  BaseConfig? config;

  Environment._internal() {
    final String staticText = "Initial";
    print(staticText);
  }
  // Environment._internal();

  // static final Environment _singleton = Environment._internal();

  static const String DEV = 'DEV';
  static const String STAGING = 'STAGING';
  static const String PROD = 'PROD';

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.PROD:
        return ProdConfig();
      case Environment.STAGING:
        return StagingConfig();
      default:
        return DevConfig();
    }
  }
}
