import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_module_stockpricechange/chart/chart_view.dart';
import 'package:flutter_module_stockpricechange/historical/cubit/stock_historical_data_cubit.dart';
import 'package:flutter_module_stockpricechange/pigeon.dart';
import 'package:stock_repository/stock_repository.dart';

import 'historical/stock_historical_view.dart';

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
    return BlocProvider(
      create: (context) => StockHistoricalDataCubit(StockRepository())..fetchData(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(_visualisationType == VisualisationType.historical ? 'Historical' : 'Chart'),
        ),
        body: _visualisationType == VisualisationType.historical ? const StockHistoricalView() : const ChartView(),
      ),
    );
  }
}
