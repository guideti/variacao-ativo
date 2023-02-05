import 'package:dio/dio.dart';

import 'models/chart.dart';

const _assetName = 'VALE3.SA';
const _baseUrl = 'https://query2.finance.yahoo.com/v8/finance';

class YahooFinanceApiClient {
  final Dio _dio = Dio(BaseOptions(baseUrl: _baseUrl));

  Future<Chart> fetchStockData() async {
    final stockData = await _dio.get('/chart/$_assetName', queryParameters: {
      'period1': 1671754857,
      'period2': 1675548194,
      'interval': '1d',
      'events': 'history',
    });

    print('StockInfo: ${stockData.data['chart']}');

    return Chart.fromJson(stockData.data['chart']);
  }
}
