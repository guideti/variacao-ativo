import 'package:dartz/dartz.dart';

import '../../../core/domain/error.dart';
import '../../domain/repository/asset_change_repository_interface.dart';
import '../datasource/asset_change_datasource_interface.dart';
import '../model/chart_response.dart';

class AssetChangeRepository implements IAssetChangeRepository {
  final IAssetChangeDatasource assetChangeDatasource;

  AssetChangeRepository(this.assetChangeDatasource);

  @override
  Future<Either<Failure, ChartResponse>> getAssetChange() async {
    return Right(await assetChangeDatasource.getAssetChange());
  }
}
