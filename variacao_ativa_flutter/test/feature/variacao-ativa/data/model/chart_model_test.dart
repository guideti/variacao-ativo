import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/data/models/actives_model.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/data/models/chart_model.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/domain/entities/chart_entity.dart';

import '../../../../mock/chart_mock.dart';


void main() {
  const chartModel = ChartModel(actives: [
    ActiveModel(quote: [8.210000038146973])
  ]);
  test('should be a subclass of MovieEntity', () {
    expect(chartModel, isA<ChartEntity>());
  });

  test('should return a valid model', () {
    final Map<String, dynamic> jsonMap = json.decode(tChartMock);
    final result = ChartModel.fromJson(jsonMap);
    expect(result, chartModel);
  });
}
