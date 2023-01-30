import 'package:freezed_annotation/freezed_annotation.dart';

part 'historical_data_item.freezed.dart';

@freezed
class HistoricalDataItem with _$HistoricalDataItem {
  factory HistoricalDataItem({
    required int timestamp,
    required double openPrice,
    double? dayOneChange,
    double? previousDayChange,
  }) = _HistoricalDataItem;
}
