import 'base_config.dart';

class DevConfig implements BaseConfig {
  String get apiHost => "http://amaanattari.ddns.net:8000/media-api/api";

  bool get reportErrors => false;

  bool get trackEvents => false;

  bool get useHttps => false;
}
