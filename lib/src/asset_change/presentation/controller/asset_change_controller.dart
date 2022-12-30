import 'package:base_app/src/asset_change/data/model/chart_response.dart';
import 'package:intl/intl.dart';
import 'package:load/load.dart';
import 'package:mobx/mobx.dart';

import '../../../presentation/util/asset_change_table.dart';
import '../../../presentation/util/price_point.dart';
import '../../domain/usecase/get_asset_change_usecase_interface.dart';

part 'asset_change_controller.g.dart';

// ignore: library_private_types_in_public_api
class AssetChangeController = _AssetChangeController
    with _$AssetChangeController;

abstract class _AssetChangeController with Store {
  final percentage = 100;

  @observable
  ObservableList<AssetChangeTable> assetChangeTable =
      ObservableList<AssetChangeTable>();
  @observable
  ObservableFuture observableFuture = ObservableFuture.value(null);

  @observable
  ObservableList<PricePoint> chartData = ObservableList<PricePoint>();

  @observable
  bool isShowGraphic = false;

  final IGetAssetChangeUsecase getAssetchangeUsecase;

  _AssetChangeController(this.getAssetchangeUsecase);

  @action
  showGraphic(bool showGraphic) => isShowGraphic = showGraphic;

  @action
  Future<void> fetchChartData() async {
    showLoadingDialog();

    ChartResponse chartResponse = await getAssetchangeUsecase();
    final resultResponse = chartResponse.chart.chartResult[0];

    // extract the last 30 records
    List<double> prices = resultResponse.getLastestPrices(limit: 30);

    // extract the last 30 records
    final currentTimes = resultResponse.getLastestTimes(limit: 30);

    // convert timestamp for datetime
    List<DateTime> dates = [];
    for (var time in currentTimes) {
      dates.add(DateTime.fromMillisecondsSinceEpoch(time));
    }

    // calculate table data
    observableFuture = ObservableFuture(_calculateTableData(prices, dates));

    // apply chart values
    _bindChartData();

    hideLoadingDialog();
  }

  _bindChartData() async {
    if (assetChangeTable.isNotEmpty) {
      for (var item in assetChangeTable) {
        chartData.add(PricePoint(item.day.toDouble(), item.price));
      }
    }
  }

  _calculateTableData(List<double> prices, List<DateTime> dates) async {
    int count = 0;
    double variationDMinusOne = 0;
    double variationFirstDate = 0;

    for (var price in prices) {
      if (count > 0 && price > 0) {
        variationDMinusOne =
            _calculateVariance(count, price, prices[count - 1]);
        variationFirstDate = _calculateVariance(count, price, prices[0]);
      }

      assetChangeTable.add(AssetChangeTable(
          day: count,
          date: _formatDate(dates[count]),
          price: price,
          percent: variationDMinusOne,
          percentFirstDate: variationFirstDate));

      variationDMinusOne = 0;
      variationFirstDate = 0;
      count++;
    }
  }

  _calculateVariance(int index, double currentPrice, double nextPrice) {
    double result = 0.0;
    final currentResult = _getPercent(currentPrice, nextPrice);

    result = (currentResult > percentage)
        ? (currentResult - percentage)
        : (percentage - currentResult);

    return result;
  }

  double _getPercent(double number, double nextNumber) =>
      (number * 100 / nextNumber);

  /// set in an extension
  String _formatDate(DateTime date) {
    final DateFormat formatter = DateFormat.yMd();
    final String formatted = formatter.format(date);
    return formatted;
  }
}
