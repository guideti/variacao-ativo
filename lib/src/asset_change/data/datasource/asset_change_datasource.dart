import 'package:dio/dio.dart';

import '../../../core/http/http_client.dart';
import '../model/chart_response.dart';
import 'asset_change_datasource_interface.dart';

class AssetChangeDatasource implements IAssetChangeDatasource {
  @override
  Future<ChartResponse> getAssetChange() async {
    Response response = await HttpClient.get('/v8/finance/chart/PETR4.SA');
    return ChartResponse.fromJson(response.data);
  }
}
