import 'package:flutter_module_stockpricechange/redux/actions.dart';
import 'package:flutter_module_stockpricechange/redux/app_state.dart';
import 'package:redux/redux.dart';

final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, LoadTradingDaysAction>(_onLoadTradingDays),
  TypedReducer<AppState, TradingDaysNotLoadedAction>(_onTradingDaysNotLoaded),
  TypedReducer<AppState, TradingDaysLoadedAction>(_onTradingDaysLoaded),
  TypedReducer<AppState, ChangeVisualisationAction>(_onChangeVisualisationType),
]);

AppState _onLoadTradingDays(AppState state, LoadTradingDaysAction _) {
  if (state.tradingDays.isNotEmpty) {
    // Ignore this action if we have data
    return state;
  }
  return state.copyWith(dataStatus: DataStatus.loading);
}

AppState _onTradingDaysNotLoaded(AppState state, TradingDaysNotLoadedAction _) =>
    state.copyWith(dataStatus: DataStatus.failure);

AppState _onTradingDaysLoaded(AppState state, TradingDaysLoadedAction action) {
  if (action.tradingDays.isEmpty) {
    // Treating this as an error, as it shouldn't happen in practice
    return state.copyWith(dataStatus: DataStatus.failure);
  }

  return state.copyWith(
    tradingDays: action.tradingDays,
    dataStatus: DataStatus.loaded,
  );
}

AppState _onChangeVisualisationType(AppState state, ChangeVisualisationAction action) => state.copyWith(
      visualisationType: action.visualisationType,
    );
