import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_module_stockpricechange/extensions/formatting_extensions.dart';
import 'package:flutter_module_stockpricechange/models/trading_day.dart';
import 'package:flutter_module_stockpricechange/redux/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sp_design_system/sp_design_system.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<TradingDay>>(
      converter: (store) => store.state.tradingDays,
      builder: (context, tradingDays) {
        return LineChart(
          mainData(context, tradingDays),
        );
      },
    );
  }

  Widget bottomTitleWidgets(BuildContext context, double value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: value == meta.min || value == meta.max
          ? Container()
          : SpText.bodyRegular12(
              DateTime.fromMicrosecondsSinceEpoch(value.toInt()).toShortString(),
              color: context.spColors.bodyLight,
            ),
    );
  }

  Widget leftTitleWidgets(BuildContext context, double value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: value == meta.min || value == meta.max
          ? Container()
          : SpText.bodyRegular12(value.toCurrency(decimalDigits: 1), color: context.spColors.bodyLight),
    );
  }

  LineChartData mainData(BuildContext context, List<TradingDay> tradingDays) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: context.spColors.border,
            strokeWidth: 1,
            dashArray: [8, 8],
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            interval: const Duration(days: 10).inMicroseconds.toDouble(),
            showTitles: true,
            getTitlesWidget: (value, meta) => bottomTitleWidgets(context, value, meta),
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) => leftTitleWidgets(context, value, meta),
            reservedSize: 52,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      lineBarsData: [
        LineChartBarData(
          spots: tradingDays
              .map(
                (day) => FlSpot(
                  day.day.microsecondsSinceEpoch.toDouble(),
                  day.openPrice,
                ),
              )
              .toList(),
          color: SpColors.green,
          barWidth: 1.5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                SpColors.green40,
                SpColors.green10,
                Colors.transparent,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
