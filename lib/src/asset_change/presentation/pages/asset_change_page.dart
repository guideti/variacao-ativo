import 'package:base_app/src/asset_change/presentation/controller/asset_change_controller.dart';
import 'package:base_app/src/core/mobx/base_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

class AssetChangePage extends StatefulWidget {
  const AssetChangePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AssetChangePageState createState() => _AssetChangePageState();
}

class _AssetChangePageState
    extends BaseStatePage<AssetChangePage, AssetChangeController> {
  final formatCurrency =
      NumberFormat.simpleCurrency(decimalDigits: 2, name: '');

  @override
  void initState() {
    super.initState();
    controller?.fetchChartData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Variação do Ativo'),
        ),
        body: Observer(builder: (_) {
          if (controller!.observableFuture.status == FutureStatus.pending) {
            return Container(
              color: Colors.white,
            );
          }
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 1.2,
            child: Column(
              children: [
                _actions(context),
                Visibility(
                  visible: !controller!.isShowGraphic,
                  child: Expanded(child: _tableView()),
                ),
                Visibility(
                  visible: controller!.isShowGraphic,
                  child: _chartView(),
                ),
              ],
            ),
          );
        }));
  }

  SizedBox _actions(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
              onPressed: () => controller?.showGraphic(false),
              child: const Text('Ver Tabela')),
          ElevatedButton(
              onPressed: () => controller?.showGraphic(true),
              child: const Text('Ver Gráfico'))
        ],
      ),
    );
  }

  Container _tableView() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10)),
            height: 30,
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            margin: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Dia'),
                Text('Data'),
                Text('Valor R\$'),
                Text('D-1'),
                Text('1º Data'),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              height: controller!.assetChangeTable.length * 30,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    final item = controller?.assetChangeTable[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('${item!.day + 1}'),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(item.date),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child:
                              Text('R\$ ${formatCurrency.format(item.price)}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child:
                              Text('${formatCurrency.format(item.percent)}%'),
                        ),
                        Text(
                            '${formatCurrency.format(item.percentFirstDate)}%'),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Divider(
                        height: .5,
                      ),
                    );
                  },
                  itemCount: controller!.assetChangeTable.length),
            ),
          )
        ],
      ),
    );
  }

  SizedBox _chartView() {
    return SizedBox(
        width: double.infinity,
        height: 300,
        child: LineChart(LineChartData(
            lineBarsData: [
              LineChartBarData(
                spots:
                    controller?.chartData.map((e) => FlSpot(e.x, e.y)).toList(),
                isCurved: false,
                dotData: FlDotData(show: false),
              ),
            ],
            titlesData: FlTitlesData(
                bottomTitles: AxisTitles(sideTitles: _bottomTitles)))));
  }

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          return Text(value.toString());
        },
      );
}
