import '../../data/model/chart_response.dart';

abstract class IAssetChangeRepository {
  Future<ChartResponse> getAssetChange();
}
