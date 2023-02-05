import 'package:flutter_module_stockpricechange/redux/actions.dart';
import 'package:flutter_module_stockpricechange/redux/app_state.dart';
import 'package:redux/redux.dart';

class RepositoryMiddleware extends MiddlewareClass<AppState> {
  // RepositoryMiddleware(this._repository);

  // final StockRepository _repository;

  @override
  call(Store<AppState> store, action, NextDispatcher next) {
    if (action is LoadTradingDaysAction) {
      _loadTradingDays(store);
    }
    next(action);
  }

  void _loadTradingDays(Store<AppState> store) async {
    await Future.delayed(const Duration(seconds: 2));

    store.dispatch(TradingDaysNotLoadedAction());
  }
}
