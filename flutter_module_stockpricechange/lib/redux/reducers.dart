import 'package:flutter_module_stockpricechange/redux/actions.dart';
import 'package:flutter_module_stockpricechange/redux/app_state.dart';
import 'package:redux/redux.dart';

final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, LoadTradingDaysAction>(_onLoadTradingDays),
  TypedReducer<AppState, TradingDaysNotLoadedAction>(_onTradingDaysNotLoaded),
  TypedReducer<AppState, TradingDaysLoadedAction>(_onTradingDaysLoaded),
]);

AppState _onLoadTradingDays(AppState state, LoadTradingDaysAction _) => state.copyWith(
      isLoading: true,
      failed: false,
    );

AppState _onTradingDaysNotLoaded(AppState state, TradingDaysNotLoadedAction _) => state.copyWith(
      isLoading: false,
      failed: true,
    );

AppState _onTradingDaysLoaded(AppState state, TradingDaysLoadedAction action) => state.copyWith(
      tradingDays: action.tradingDays,
      isLoading: false,
      failed: false,
    );
