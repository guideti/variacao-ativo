import 'package:freezed_annotation/freezed_annotation.dart';

import 'result.dart';

part 'chart.freezed.dart';
part 'chart.g.dart';

@freezed
class Chart with _$Chart {
  factory Chart({
    required List<Result> result,
  }) = _Chart;

  factory Chart.fromJson(Map<String, dynamic> json) => _$ChartFromJson(json);
}
