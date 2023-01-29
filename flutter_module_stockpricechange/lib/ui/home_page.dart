import 'package:flutter/material.dart';

import 'historical/stock_historical_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: StockHistoricalWidget(),
    );
  }
}
