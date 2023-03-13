import 'package:variacao_ativa_flutter/features/variacao-ativa/data/models/actives_model.dart';

import '../../domain/entities/chart_entity.dart';

class ChartModel extends ChartEntity {
  const ChartModel({required super.actives});
  factory ChartModel.fromJson(Map<String, dynamic> json) => ChartModel(
        actives: (json['chart']['result'] as List)
            .map((e) => ActiveModel.fromJson(e.cast<String, dynamic>()))
            .toList(),
      );
}
