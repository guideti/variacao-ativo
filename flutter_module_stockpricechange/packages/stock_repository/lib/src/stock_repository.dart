import 'package:stock_repository/src/models/stock_price_day.dart';
import 'package:yahoo_finance_api/yahoo_finance_api.dart';

class StockRepository {
  StockRepository({YahooFinanceApiClient? apiClient}) : _apiClient = apiClient ?? YahooFinanceApiClient();

  final YahooFinanceApiClient _apiClient;

  Future<List<StockPriceDay>> getStockPriceData() async {
    final today = DateTime.now();
    // We use the starting point as 45 days ago to account for days the stock market is closed
    final startingDate = today.subtract(const Duration(days: 45));

    final from = startingDate.millisecondsSinceEpoch ~/ 1000;
    final until = today.millisecondsSinceEpoch ~/ 1000;

    final stockData = await _apiClient.fetchStockData(from: from, until: until);
    return stockData.toDailyPrices();
  }
}

extension on Chart {
  List<StockPriceDay> toDailyPrices() {
    final timestamps = result.first.timestamp;
    final openPrices = result.first.indicators.quote.first.open;
    final closePrices = result.first.indicators.quote.first.close;
    final lowPrices = result.first.indicators.quote.first.low;
    final highPrices = result.first.indicators.quote.first.high;

    final dailyPrices = timestamps
        .mapIndexed((index, element) {
          final open = openPrices[index];
          final close = closePrices[index];
          final low = lowPrices[index];
          final high = highPrices[index];
          return StockPriceDay(timestamp: element * 1000, open: open, close: close, low: low, high: high);
        })
        .skip(openPrices.length < 30 ? 0 : openPrices.length - 30) // Discard first items so we end up with 30
        .toList();

    return dailyPrices;
  }
}

extension ExtendedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(int index, E element) f) {
    var i = 0;
    return map((e) => f(i++, e));
  }
}
