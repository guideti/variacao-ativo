import 'package:flutter_module_stockpricechange/models/trading_day.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    required List<TradingDay> tradingDays,
    required bool isLoading,
    required bool failed,
  }) = _AppState;
}
