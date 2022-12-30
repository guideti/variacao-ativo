import 'chart.dart';

class ChartResponse {
  Chart chart;
  ChartResponse(this.chart);

  ChartResponse.fromJson(Map<String, dynamic> json)
      : chart = Chart.fromJson(json['chart']);
}
