import 'package:base_app/src/asset_change/domain/repository/asset_change_repository_interface.dart';

import '../../data/model/chart_response.dart';
import 'get_asset_change_usecase_interface.dart';

class GetAssetChangeUsecase implements IGetAssetChangeUsecase {
  final IAssetChangeRepository assetChangeRepository;

  GetAssetChangeUsecase(this.assetChangeRepository);

  @override
  Future<ChartResponse> call() async {
    return assetChangeRepository.getAssetChange();
  }
}
