import 'package:base_app/src/asset_change/data/datasource/asset_change_datasource.dart';
import 'package:base_app/src/asset_change/domain/repository/asset_change_repository_interface.dart';
import 'package:base_app/src/asset_change/domain/usecase/get_asset_change_usecase_interface.dart';
import 'package:base_app/src/asset_change/presentation/controller/asset_change_controller.dart';
import 'package:get_it/get_it.dart';

import '../../asset_change/data/datasource/asset_change_datasource_interface.dart';
import '../../asset_change/data/repository/asset_change_repository.dart';
import '../../asset_change/domain/usecase/get_asset_change_usecase.dart';

void initializeDi(GetIt getIt) async {
  initializeDatasource(getIt);
  initializeRepository(getIt);
  initializeUseCases(getIt);
  initializeControllers(getIt);
}

void initializeDatasource(GetIt getIt) {
  getIt.registerFactory<IAssetChangeDatasource>(() => AssetChangeDatasource());
}

void initializeRepository(GetIt getIt) {
  getIt.registerFactory<IAssetChangeRepository>(
      () => AssetChangeRepository(getIt()));
}

void initializeUseCases(GetIt getIt) {
  getIt.registerFactory<IGetAssetChangeUsecase>(
      () => GetAssetChangeUsecase(getIt()));
}

void initializeControllers(GetIt getIt) {
  getIt.registerLazySingleton(() => AssetChangeController(getIt()));
}
