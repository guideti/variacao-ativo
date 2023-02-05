import 'package:flutter/material.dart';
import 'package:flutter_module_stockpricechange/chart/chart_view.dart';
import 'package:flutter_module_stockpricechange/pigeon.dart';
import 'package:flutter_svg/svg.dart';

import 'table/table_view.dart';

typedef DisplayStockDataEventReceived = void Function(VisualisationType visualisationType);

class FlutterStockApiHandler extends FlutterStockApi {
  FlutterStockApiHandler(this.onEventReceived);

  final DisplayStockDataEventReceived onEventReceived;

  @override
  void displayStockData(Visualisation visualisation) {
    onEventReceived(visualisation.visualisationType);
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NativeNavigationApi navigationApi = NativeNavigationApi();
  var _visualisationType = VisualisationType.chart;

  @override
  void initState() {
    super.initState();

    FlutterStockApi.setup(FlutterStockApiHandler((visualisationType) {
      setState(() {
        _visualisationType = visualisationType;
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            // TODO(lucas): Use constants for assets
            icon: SvgPicture.asset('assets/back_icon.svg'),
            onPressed: () => navigationApi.goBack(),
          ),
        ),
      ),
      body: SafeArea(
        child: _visualisationType == VisualisationType.table ? const TableView() : const ChartView(),
      ),
    );
  }
}
