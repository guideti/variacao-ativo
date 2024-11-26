import '../../../../presentation/presentation.dart';
import '../../../../ui/pages/pages.dart';
import '../../usecases/usecases.dart';

HomePresenter makeGetxHomePresenter() {
  return GetxHomePresenter(
    loadChart: makeRemoteLoadChartFactory(),
    cacheChart: makeRemoteCacheChartFactory(),
  );
}
