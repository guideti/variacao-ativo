import 'package:flutter_module_stockpricechange/models/trading_day.dart';
import 'package:flutter_module_stockpricechange/pigeon.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

enum DataStatus { initial, loading, loaded, failure }

@freezed
class AppState with _$AppState {
  factory AppState({
    required List<TradingDay> tradingDays,
    required DataStatus dataStatus,
    required VisualisationType visualisationType,
  }) = _AppState;
}
