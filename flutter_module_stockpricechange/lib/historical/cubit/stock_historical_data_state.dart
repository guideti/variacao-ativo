import 'package:freezed_annotation/freezed_annotation.dart';

part 'stock_historical_data_state.freezed.dart';

@freezed
class StockHistoricalDataState with _$StockHistoricalDataState {
  const factory StockHistoricalDataState.initial() = _Initial;
  const factory StockHistoricalDataState.loading() = _Loading;
  const factory StockHistoricalDataState.success() = _Sucess;
  const factory StockHistoricalDataState.failure() = _Failure;
}
