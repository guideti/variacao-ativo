import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_price_day.freezed.dart';

@freezed
class StockPriceDay with _$StockPriceDay {
  factory StockPriceDay({
    required int timestamp,
    required double open,
  }) = _StockPriceDay;
}
