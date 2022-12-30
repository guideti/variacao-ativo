import '../../domain/repository/asset_change_repository_interface.dart';
import '../datasource/asset_change_datasource_interface.dart';
import '../model/chart_response.dart';

class AssetChangeRepository implements IAssetChangeRepository {
  final IAssetChangeDatasource assetChangeDatasource;

  AssetChangeRepository(this.assetChangeDatasource);

  @override
  Future<ChartResponse> getAssetChange() async {
    return assetChangeDatasource.getAssetChange();
  }
}
