import 'package:flutter_module_stockpricechange/models/trading_day.dart';
import 'package:flutter_module_stockpricechange/redux/actions.dart';
import 'package:flutter_module_stockpricechange/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:stock_repository/stock_repository.dart';

class RepositoryMiddleware extends MiddlewareClass<AppState> {
  RepositoryMiddleware(this._repository);

  final StockRepository _repository;

  @override
  call(Store<AppState> store, action, NextDispatcher next) {
    if (action is LoadTradingDaysAction) {
      _loadTradingDays(store);
    }
    next(action);
  }

  void _loadTradingDays(Store<AppState> store) async {
    await Future.delayed(const Duration(seconds: 2));

    try {
      final days = await _repository.getStockPriceData();
      final firstDay = days.first;

      final tradingDays = days.mapIndexed((index, day) {
        double? previousDayChange;
        double? thirtyDaysChange;

        if (index > 0) {
          final previousDay = days[index - 1];
          previousDayChange = (day.open - previousDay.open) / previousDay.open;
          thirtyDaysChange = (day.open - firstDay.open) / firstDay.open;
        }

        return TradingDay(
          day: DateTime.fromMillisecondsSinceEpoch(day.timestamp),
          openPrice: day.open,
          previousDayChange: previousDayChange,
          thirtyDaysChange: thirtyDaysChange,
        );
      }).toList(growable: false);

      store.dispatch(TradingDaysLoadedAction(tradingDays));
    } catch (_) {
      store.dispatch(TradingDaysNotLoadedAction());
    }
  }
}
