import 'package:ativo/layers/domain/domain.dart';
import 'package:faker/faker.dart';

class ParamsFactory {
  static LoadChartParams makeChartParams() => LoadChartParams(
        periodOne: faker.randomGenerator.integer(1000),
        periodTwo: faker.randomGenerator.integer(1000),
        interval: faker.randomGenerator.string(1),
      );
}
