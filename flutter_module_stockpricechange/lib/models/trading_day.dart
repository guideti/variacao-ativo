import 'package:freezed_annotation/freezed_annotation.dart';

part 'trading_day.freezed.dart';

@freezed
class TradingDay with _$TradingDay {
  factory TradingDay({
    required DateTime day,
    required double openPrice,
    required double closePrice,
    required double lowPrice,
    required double highPrice,
  }) = _TradingDay;
}
