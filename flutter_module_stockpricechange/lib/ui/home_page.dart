import 'package:flutter/material.dart';
import 'package:flutter_module_stockpricechange/pigeon.dart';
import 'package:flutter_module_stockpricechange/ui/chart/stock_chart_widget.dart';

import 'historical/stock_historical_widget.dart';

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
  var _visualisationType = VisualisationType.historical;

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
        title: Text(_visualisationType == VisualisationType.historical ? 'Historical' : 'Chart'),
      ),
      body:
          _visualisationType == VisualisationType.historical ? const StockHistoricalWidget() : const StockChartWidget(),
    );
  }
}
