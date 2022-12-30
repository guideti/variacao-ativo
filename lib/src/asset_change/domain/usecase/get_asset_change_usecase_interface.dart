import '../../data/model/chart_response.dart';

abstract class IGetAssetChangeUsecase {
  Future<ChartResponse> call();
}
