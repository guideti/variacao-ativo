

import '../../domain/entities/chart_entity.dart';
import 'indicators_model.dart';

class ChartModel extends ChartEntity {
  const ChartModel({required super.indicators});
  factory ChartModel.fromJson(Map<String, dynamic> json) => ChartModel(
        indicators: (json['result'] as List)
            .map((e) => IndicatorsModel.fromJson(e))
            .toList(),
      );
}
