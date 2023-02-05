import 'package:flutter_module_stockpricechange/models/trading_day.dart';

class LoadTradingDaysAction {}

class TradingDaysNotLoadedAction {}

class TradingDaysLoadedAction {
  TradingDaysLoadedAction(this.tradingDays);

  final List<TradingDay> tradingDays;
}
