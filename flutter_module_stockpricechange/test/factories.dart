import 'package:collection/collection.dart';
import 'package:flutter_module_stockpricechange/models/trading_day.dart';
import 'package:flutter_module_stockpricechange/models/trading_day_with_stats.dart';
import 'package:flutter_module_stockpricechange/pigeon/api.dart';
import 'package:flutter_module_stockpricechange/redux/app_state.dart';

AppState buildAppState({
  List<TradingDayWithStats> tradingDays = const [],
  DataStatus dataStatus = DataStatus.initial,
  VisualisationType visualisationType = VisualisationType.table,
}) =>
    AppState(
      tradingDays: tradingDays,
      dataStatus: dataStatus,
      visualisationType: visualisationType,
    );

TradingDay buildTradingDay({
  DateTime? day,
  double openPrice = 1,
  double closePrice = 1,
  double highPrice = 1,
  double lowPrice = 1,
}) =>
    TradingDay(
      day: day ?? DateTime(2000),
      openPrice: openPrice,
      closePrice: closePrice,
      highPrice: highPrice,
      lowPrice: lowPrice,
    );

List<TradingDay> buildListOfTradingDays(List<double> prices) {
  return prices
      .mapIndexed((index, price) => buildTradingDay(
            day: DateTime(2000, 1, index + 1),
            openPrice: price,
          ))
      .toList();
}

TradingDayWithStats buildTradingDayWithStats() => TradingDayWithStats(
      tradingDay: buildTradingDay(),
    );

List<TradingDayWithStats> buildListOfTradingDayWithStats(int count) {
  final tradingDays = <TradingDayWithStats>[];

  for (int i = 0; i < count; i++) {
    tradingDays.add(buildTradingDayWithStats());
  }

  return tradingDays;
}
