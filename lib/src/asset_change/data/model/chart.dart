import 'chart_result.dart';

class Chart {
  List<ChartResult> chartResult;
  Chart(this.chartResult);
  Chart.fromJson(Map<String, dynamic> json)
      : chartResult = (json['result'] as List)
            .map((e) => ChartResult.fromJson(e))
            .toList();
}
