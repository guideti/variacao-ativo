import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_module_stockpricechange/historical/cubit/stock_historical_data_cubit.dart';

import 'cubit/stock_historical_data_state.dart';

class StockHistoricalView extends StatelessWidget {
  const StockHistoricalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<StockHistoricalDataCubit, StockHistoricalDataState>(builder: (context, state) {
        return state.when(
          initial: () => Container(),
          loading: () => const Text('Loading'),
          success: (historicalItems) {
            return ListView.builder(
              itemCount: historicalItems.length,
              itemBuilder: (context, index) {
                final item = historicalItems[index];
                return ListTile(
                  title: Text("Price: R\$${item.openPrice.toStringAsFixed(2)}"),
                  subtitle: Text(
                      "D1: ${item.dayOneChange == null ? '-' : (item.dayOneChange! * 100).toStringAsFixed(2)} \t\t Previous: ${item.previousDayChange == null ? '-' : (item.previousDayChange! * 100).toStringAsFixed(2)}"),
                );
              },
            );
          },
          failure: () => const Text('Failure'),
        );
      }),
    );
  }
}
