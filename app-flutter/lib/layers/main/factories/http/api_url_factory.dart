import '../../../../commons/network/base/base.dart';

NetworkBaseConfig _instance = NetworkBaseConfig();

String makeApiUrl(String path) => '${_instance.config.apiHostRest}/$path';
