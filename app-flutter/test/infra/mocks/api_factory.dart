import 'package:faker/faker.dart';

class ApiFactory {
  static Map makeChartResultJson() => {
        'chart': {
          'result': [
            {
              'meta': {
                'symbol': faker.randomGenerator.string(1),
                'timestamp': faker.randomGenerator.numbers(1679278303, 45),
                'indicators': {
                  'quote': [
                    {
                      'open': faker.randomGenerator.numbers(1, 45),
                    },
                  ]
                }
              }
            },
          ],
        },
        'error': null
      };

  static Map makeInvalidJson() => {'invalid_key': 'invalid_value'};
}
