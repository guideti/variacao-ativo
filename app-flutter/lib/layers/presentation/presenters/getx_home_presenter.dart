import 'dart:math';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../commons/commons.dart';
import '../../domain/domain.dart';
import '../../ui/helpers/helpers.dart';
import '../../ui/pages/pages.dart';
import '../mixins/mixins.dart';

class GetxHomePresenter extends GetxController with LoadingManager, NavigationManager, UISnackbarMessageManager implements HomePresenter {
  GetxHomePresenter({
    required this.loadChart,
    required this.cacheChart,
  });

  final LoadChart loadChart;
  final CacheChart cacheChart;
  String typeActive = "PETR4.SA";

  late MethodChannel _channel;

  @override
  void onInit() {
    _channel = const MethodChannel('app-flutter-engine');
    _channel.setMethodCallHandler((call) async {
      if (call.method == "setActive") {
        typeActive = (call.arguments as String?) ?? "PETR4.SA";
        isReceiver = true;
        fetch();
      } else {
        throw Exception('not implemented ${call.method}');
      }
    });

    fetch();
    super.onInit();
  }

  @override
  RxList<ChartViewModel> get chartListRx => _chartList;
  final RxList<ChartViewModel> _chartList = RxList<ChartViewModel>([]);
  set chartList(List<ChartViewModel> value) => _chartList.value = value;

  @override
  RxList<TableViewModel> get tableListRx => _tableList;
  final RxList<TableViewModel> _tableList = RxList<TableViewModel>([]);
  set tableList(List<TableViewModel> value) => _tableList.value = value;

  @override
  Rx<IntervalEnum> get intervalRx => _intervalRx;
  final Rx<IntervalEnum> _intervalRx = Rx<IntervalEnum>(IntervalEnum.oneDay);
  set interval(IntervalEnum value) => _intervalRx.value = value;

  @override
  Rx<RangeDateEnum> get rangeDateRx => _rangeDateRx;
  final Rx<RangeDateEnum> _rangeDateRx = Rx<RangeDateEnum>(RangeDateEnum.oneYear);
  set rangeDate(RangeDateEnum value) => _rangeDateRx.value = value;

  @override
  Rx<TotalItemEnum> get totalItemRx => _totalItemRx;
  final Rx<TotalItemEnum> _totalItemRx = Rx<TotalItemEnum>(TotalItemEnum.thirty);
  set totalItem(TotalItemEnum value) => _totalItemRx.value = value;

  @override
  RxBool get isReceiverRx => _isReceiver;
  final _isReceiver = false.obs;
  set isReceiver(bool value) => _isReceiver.value = value;

  @override
  int random() => 5 + Random().nextInt(50);

  @override
  void changeTotalItem(TotalItemEnum value) => totalItem = value;

  @override
  void changeRangeDate(RangeDateEnum value) => rangeDate = value;

  @override
  void changeInterval(IntervalEnum value) => interval = value;

  @override
  Future<void> fetch() async {
    int startTimestamp = 0;
    int finalTimestamp = (DateTime.now().millisecondsSinceEpoch / 1000).round();

    switch (rangeDateRx.value) {
      case RangeDateEnum.oneDay:
        startTimestamp = calcTimestamp(1);
        break;
      case RangeDateEnum.oneWeek:
        startTimestamp = calcTimestamp(7);
        break;
      case RangeDateEnum.oneMonth:
        startTimestamp = calcTimestamp(31);
        break;
      case RangeDateEnum.oneYear:
        startTimestamp = calcTimestamp(365);
        break;
    }

    try {
      isLoading = true;

      final either = await loadChart.fetch(
        typeActive,
        params: LoadChartParams(
          periodOne: startTimestamp,
          periodTwo: finalTimestamp,
          interval: intervalRx.value.toParams(),
        ),
      );

      either.fold(
        (failure) {
          fetchCache();

          List<String> errors = [];
          for (var element in (failure.errors ?? [])) {
            errors.add(element);
          }

          mainSnackbarMessage = UISnackbarMessage(
            message: failure.message.tr,
            details: errors,
          );
        },
        (success) {
          changingDataToView(success);
          saveCache(success);
        },
      );
    } catch (error) {
      fetchCache();

      mainSnackbarMessage = UISnackbarMessage(
        message: error.toString(),
        details: [],
      );
    } finally {
      isLoading = false;
    }
  }

  Future<void> saveCache(ChartEntity entity) async {
    try {
      await cacheChart.delete(typeActive);
      await cacheChart.save(typeActive, entity);
    } catch (error) {}
  }

  Future<void> fetchCache() async {
    try {
      final either = await cacheChart.fetch(typeActive);

      either.fold(
        (failure) {
          List<String> errors = [];
          for (var element in (failure.errors ?? [])) {
            errors.add(element);
          }

          mainSnackbarMessage = UISnackbarMessage(
            message: failure.message.tr,
            details: errors,
          );
        },
        (success) {
          if (success != null) {
            changingDataToView(success);
          }
        },
      );
    } catch (error) {
      mainSnackbarMessage = UISnackbarMessage(
        message: error.toString(),
        details: [],
      );
    }
  }

  void changingDataToView(ChartEntity entity) {
    List<TableViewModel> table = [];
    List<ChartViewModel> chart = [];

    List<double> openWithRange = [];
    List<DateTime> timestampWithRange = [];

    int countTotal = totalItemRx.value.toCount();

    if (countTotal > entity.open.length) {
      openWithRange = entity.open.getRange(0, entity.open.length).toList();
    } else {
      openWithRange = entity.open.getRange(entity.open.length - countTotal, entity.open.length).toList();
    }

    if (countTotal > entity.timestamp.length) {
      timestampWithRange = entity.timestamp.getRange(0, entity.timestamp.length).toList();
    } else {
      timestampWithRange = entity.timestamp.getRange(entity.timestamp.length - countTotal, entity.timestamp.length).toList();
    }

    for (var index = 0; index < openWithRange.length; index++) {
      double variationInRelationToDMinus1 = calcVariationInRelationToDMinus1(index, openWithRange);
      double variationFromTheFirstDate = calcVariationFromTheFirstDate(index, openWithRange);

      table.add(
        TableViewModel(
          date: timestampWithRange[index].formart(),
          value: 'R\$ ${openWithRange[index].toStringAsFixed(2)}',
          variationInRelationToDMinus1: variationInRelationToDMinus1 != 0.0 ? "$variationInRelationToDMinus1%" : "-",
          variationFromTheFirstDate: variationFromTheFirstDate != 0.0 ? "$variationFromTheFirstDate%" : "-",
        ),
      );

      chart.add(
        ChartViewModel(
          date: timestampWithRange[index].formart(),
          variationInRelationToDMinus1: variationInRelationToDMinus1,
          variationFromTheFirstDate: variationFromTheFirstDate,
        ),
      );
    }

    tableList = table;
    chartList = chart;
  }

  double calcVariationInRelationToDMinus1(int index, List<double> list) {
    if (index == 0) {
      return 0.0;
    }

    return double.parse(calcVariation(list[index], list[index - 1]).toStringAsFixed(2));
  }

  double calcVariationFromTheFirstDate(int index, List<double> list) {
    if (index == 0) {
      return 0.0;
    }

    return double.parse(calcVariation(list[index], list[0]).toStringAsFixed(2));
  }

  double calcVariation(double valueAtLaterTime, double valueAtThePreviousMoment) {
    if (valueAtThePreviousMoment == 0.0) {
      return valueAtLaterTime;
    }

    return ((valueAtLaterTime / valueAtThePreviousMoment) - 1) * 100;
  }

  int calcTimestamp(int days) {
    return (DateTime.now().subtract(Duration(days: days)).millisecondsSinceEpoch / 1000).round();
  }
}
