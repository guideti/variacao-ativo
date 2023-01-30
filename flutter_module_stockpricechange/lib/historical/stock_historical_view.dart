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
          success: () => const Text('Success'),
          failure: () => const Text('Failure'),
        );
      }),
    );
  }
}
