import 'indicator.dart';

class ChartResult {
  List<int> timestamp;
  Indicator indicator;

  ChartResult(this.timestamp, this.indicator);

  ChartResult.fromJson(Map<String, dynamic> json)
      : timestamp = (json['timestamp'] as List).map((e) => e as int).toList(),
        indicator = Indicator.fromJson(json['indicators']);

  List<double> getLastestPrices({required int limit}) =>
      indicator.quote[0].quoteOpen.sublist(
          indicator.quote[0].quoteOpen.length - limit,
          indicator.quote[0].quoteOpen.length);

  List<int> getLastestTimes({required int limit}) =>
      timestamp.sublist(timestamp.length - limit, timestamp.length);
}
