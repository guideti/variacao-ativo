import '../model/chart_response.dart';

abstract class IAssetChangeDatasource {
  Future<ChartResponse> getAssetChange();
}
