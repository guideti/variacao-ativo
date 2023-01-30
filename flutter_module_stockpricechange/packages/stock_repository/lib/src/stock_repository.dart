import 'package:stock_repository/src/models/stock_price_day.dart';
import 'package:yahoo_finance_api/yahoo_finance_api.dart';

class StockRepository {
  StockRepository({YahooFinanceApiClient? apiClient}) : _apiClient = apiClient ?? YahooFinanceApiClient();

  final YahooFinanceApiClient _apiClient;

  Future<List<StockPriceDay>> getStockPriceData() async {
    final stockData = await _apiClient.fetchStockData();
    return stockData.toDailyPrices();
  }
}

extension on Chart {
  List<StockPriceDay> toDailyPrices() {
    final timestamps = result.timestamp;
    final openPrices = result.indicators.quote.open;

    final dailyPrices = timestamps.mapIndexed((index, element) {
      final price = openPrices[index];
      return StockPriceDay(date: DateTime.fromMicrosecondsSinceEpoch(element), open: price);
    }).toList();

    return dailyPrices;
  }
}

extension ExtendedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(int index, E element) f) {
    var i = 0;
    return map((e) => f(i++, e));
  }
}
