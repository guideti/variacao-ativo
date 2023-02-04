import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sp_design_system/sp_design_system.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      mainData(context),
    );
  }

  Widget bottomTitleWidgets(BuildContext context, double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 2:
        text = 'MAR';
        break;
      case 5:
        text = 'JUN';
        break;
      case 8:
        text = 'SEP';
        break;
      default:
        text = '';
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: SpText.bodyRegular12(text, color: context.spColors.bodyLight),
    );
  }

  Widget leftTitleWidgets(BuildContext context, double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 2:
        text = '20K';
        break;
      case 3:
        text = '30k';
        break;
      case 4:
        text = '40k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return SpText.bodyRegular12(text, color: context.spColors.bodyLight);
  }

  LineChartData mainData(BuildContext context) {
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
            showTitles: true,
            // reservedSize: 22,
            // interval: 1,
            getTitlesWidget: (value, meta) => bottomTitleWidgets(context, value, meta),
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            // interval: 1,
            getTitlesWidget: (value, meta) => leftTitleWidgets(context, value, meta),
            reservedSize: 26,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
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
