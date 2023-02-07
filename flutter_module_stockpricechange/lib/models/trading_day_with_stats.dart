import 'package:flutter_module_stockpricechange/models/trading_day.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'trading_day_with_stats.freezed.dart';

@freezed
class TradingDayWithStats with _$TradingDayWithStats {
  const TradingDayWithStats._();

  const factory TradingDayWithStats({
    required TradingDay tradingDay,
    double? previousDayChange,
    double? thirtyDaysChange,
  }) = _TradingDayWithStats;

  // Helper getters to make code easier to read
  DateTime get day => tradingDay.day;
  double get openPrice => tradingDay.openPrice;
  double get closePrice => tradingDay.closePrice;
  double get lowPrice => tradingDay.lowPrice;
  double get highPrice => tradingDay.highPrice;
}
