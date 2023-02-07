import 'package:flutter_module_stockpricechange/data/trading_days_repository.dart';
import 'package:flutter_module_stockpricechange/redux/actions.dart';
import 'package:flutter_module_stockpricechange/redux/app_state.dart';
import 'package:redux/redux.dart';

class RepositoryMiddleware extends MiddlewareClass<AppState> {
  RepositoryMiddleware(this._repository);

  final TradingDaysRepository _repository;

  @override
  call(Store<AppState> store, action, NextDispatcher next) {
    if (action is LoadTradingDaysAction) {
      _loadTradingDays(store);
    }
    next(action);
  }

  void _loadTradingDays(Store<AppState> store) async {
    try {
      final tradingDays = await _repository.getLastThirtyTradingDays();
      store.dispatch(TradingDaysLoadedAction(tradingDays));
    } catch (_) {
      store.dispatch(TradingDaysNotLoadedAction());
    }
  }
}
