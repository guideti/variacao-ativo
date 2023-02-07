import 'package:collection/collection.dart';
import 'package:flutter_module_stockpricechange/models/trading_day.dart';
import 'package:yahoo_finance_api/yahoo_finance_api.dart';

class TradingDaysRepository {
  TradingDaysRepository(this._apiClient);

  final YahooFinanceApiClient _apiClient;

  Future<List<TradingDay>> getLastThirtyTradingDays() async {
    final endDate = _computeEndDate();
    // We subtract 45 days to account for the days the stock market is closed
    final startDate = endDate.subtract(const Duration(days: 45));

    final apiData = await _apiClient.getTradingDays(
      from: startDate.secondsSinceEpoch,
      until: endDate.secondsSinceEpoch,
    );

    final tradingDays = apiData.tradingDays;
    return tradingDays.takeLast(30); // Take only the latest 30 trading days
  }

  // Returns a DateTime that is set to the end of yesterday.
  // We ignore today's data because it keeps changing if the day hasn't ended yet.
  DateTime _computeEndDate() {
    final today = DateTime.now();
    final yesterday = today.subtract(const Duration(days: 1)).copyWith(hour: 23);
    return yesterday;
  }
}

extension on DateTime {
  int get secondsSinceEpoch => millisecondsSinceEpoch ~/ 1000;
}

extension on Chart {
  List<TradingDay> get tradingDays {
    final timestamps = result.first.timestamp;
    final openPrices = result.first.indicators.quote.first.open;
    final closePrices = result.first.indicators.quote.first.close;
    final lowPrices = result.first.indicators.quote.first.low;
    final highPrices = result.first.indicators.quote.first.high;

    return timestamps.mapIndexed((index, timestamp) {
      return TradingDay(
        // The api returns the timestamp in secondsSinceEpoch, so we need to convert it
        day: DateTime.fromMillisecondsSinceEpoch(timestamp.toMilliseconds()),
        openPrice: openPrices[index],
        closePrice: closePrices[index],
        lowPrice: lowPrices[index],
        highPrice: highPrices[index],
      );
    }).toList();
  }
}

extension on int {
  int toMilliseconds() => this * 1000;
}

extension<T> on List<T> {
  List<T> takeLast(int total) {
    if (length <= total) {
      return this;
    }
    return sublist(total - length);
  }
}
