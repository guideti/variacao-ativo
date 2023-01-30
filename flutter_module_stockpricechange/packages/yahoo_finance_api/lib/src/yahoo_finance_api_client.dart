import 'package:dio/dio.dart';

import 'models/chart.dart';

const _assetName = 'VALE3.SA';
const _baseUrl = 'https://query2.finance.yahoo.com/v8/finance/chart/$_assetName';

class YahooFinanceApiClient {
  final Dio _dio = Dio(BaseOptions(baseUrl: _baseUrl));

  Future<Chart> fetchStockData() async {
    final stockData = await _dio.get('/', queryParameters: {
      'period1': 1672172319,
      'period2': 1674850719,
      'interval': '1d',
      'events': 'history',
    });

    print('StockInfo: ${stockData.data}');

    return Chart.fromJson(stockData.data);
  }
}
