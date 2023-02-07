import 'package:dio/dio.dart';

import 'models/chart.dart';

const _assetName = 'VALE3.SA';
const _baseUrl = 'https://query2.finance.yahoo.com/v8/finance';

class YahooFinanceApiClient {
  final Dio _dio = Dio(BaseOptions(baseUrl: _baseUrl));

  Future<Chart> getTradingDays({required int from, required int until}) async {
    final response = await _dio.get('/chart/$_assetName', queryParameters: {
      'period1': from,
      'period2': until,
      'interval': '1d',
      'events': 'history',
    });

    return Chart.fromJson(response.data['chart']);
  }
}
