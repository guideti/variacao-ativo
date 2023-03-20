import './network_base.dart';

class ProductionEnvironmental implements NetworkBase {
  @override
  String get apiHostRest => 'https://query1.finance.yahoo.com';
}

class StagingEnvironmental implements NetworkBase {
  @override
  String get apiHostRest => 'https://query1.finance.yahoo.com';
}

class TestingEnvironmental implements NetworkBase {
  @override
  String get apiHostRest => 'https://query1.finance.yahoo.com';
}

class DevelopmentEnvironmental implements NetworkBase {
  @override
  String get apiHostRest => 'https://query1.finance.yahoo.com';
}

class LocalEnvironmental implements NetworkBase {
  @override
  String get apiHostRest => 'https://query1.finance.yahoo.com';
}
