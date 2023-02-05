import 'package:flutter_module_stockpricechange/models/trading_day.dart';
import 'package:flutter_module_stockpricechange/pigeon.dart';

class LoadTradingDaysAction {}

class TradingDaysNotLoadedAction {}

class TradingDaysLoadedAction {
  TradingDaysLoadedAction(this.tradingDays);

  final List<TradingDay> tradingDays;
}

class ChangeVisualisationAction {
  ChangeVisualisationAction(this.visualisationType);

  final VisualisationType visualisationType;
}
