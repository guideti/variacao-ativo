import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:get/get.dart';

import '../../../ui.dart';

class ChartWidget extends StatelessWidget {
  final HomePresenter presenter;

  const ChartWidget({required this.presenter, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Obx(
        () {
          var chart = presenter.chartListRx.toList();
          return SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            legend: Legend(
              isVisible: true,
              position: LegendPosition.top,
              orientation: LegendItemOrientation.vertical,
            ),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries<ChartViewModel, String>>[
              LineSeries<ChartViewModel, String>(
                dataSource: chart,
                xValueMapper: (ChartViewModel chart, _) => chart.date,
                yValueMapper: (ChartViewModel chart, _) => chart.variationInRelationToDMinus1,
                name: 'Variação em relaçào a D-1',
                dataLabelSettings: const DataLabelSettings(isVisible: true),
              ),
              LineSeries<ChartViewModel, String>(
                dataSource: chart,
                xValueMapper: (ChartViewModel chart, _) => chart.date,
                yValueMapper: (ChartViewModel chart, _) => chart.variationFromTheFirstDate,
                name: 'Variação em relação a primeira data',
                dataLabelSettings: const DataLabelSettings(isVisible: true),
              )
            ],
          );
        },
      ),
    );
  }
}
