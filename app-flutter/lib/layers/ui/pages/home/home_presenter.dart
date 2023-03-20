import 'package:get/get.dart';

import '../../helpers/helpers.dart';
import './enum/enum.dart';
import './viewmodel/viewmodel.dart';

abstract class HomePresenter {
  Stream<SnackbarMessage?> get mainSnackbarMessageStream;
  RxList<TableViewModel> get tableListRx;
  RxList<ChartViewModel> get chartListRx;
  Rx<RangeDateEnum> get rangeDateRx;
  Rx<TotalItemEnum> get totalItemRx;
  Rx<IntervalEnum> get intervalRx;
  RxBool get isLoadingRx;

  int random();

  void changeTotalItem(TotalItemEnum value);
  void changeRangeDate(RangeDateEnum value);
  void changeInterval(IntervalEnum value);

  Future<void> fetch();
}
