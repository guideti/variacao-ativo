import 'package:base_app/src/asset_change/domain/repository/asset_change_repository_interface.dart';
import 'package:dartz/dartz.dart';

import '../../../core/domain/error.dart';
import '../../data/model/chart_response.dart';
import 'get_asset_change_usecase_interface.dart';

class GetAssetChangeUsecase implements IGetAssetChangeUsecase {
  final IAssetChangeRepository assetChangeRepository;

  GetAssetChangeUsecase(this.assetChangeRepository);

  @override
  Future<Either<Failure, ChartResponse>> call() async {
    return assetChangeRepository.getAssetChange();
  }
}
