import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_module_stockpricechange/historical/cubit/stock_historical_data_cubit.dart';
import 'package:sp_design_system/sp_design_system.dart';

import 'cubit/stock_historical_data_state.dart';

class StockHistoricalView extends StatelessWidget {
  const StockHistoricalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: BlocBuilder<StockHistoricalDataCubit, StockHistoricalDataState>(builder: (context, state) {
          return state.when(
            initial: () => Container(),
            loading: () => const Center(
              child: CircularProgressIndicator(color: SpColors.green),
            ),
            success: (historicalItems) {
              final widgets = historicalItems
                  .map((e) => [
                        SpText.bodyRegular14('01/01/2021', color: context.spColors.body),
                        SpText.bodyRegular14('R\$${e.openPrice.toStringAsFixed(2)}', color: context.spColors.body),
                        SpText.bodyRegular14(
                          e.previousDayChange == null ? '-' : '${(e.previousDayChange! * 100).toStringAsFixed(2)}%',
                          color: context.spColors.body,
                        ),
                        SpText.bodyRegular14(
                          e.dayOneChange == null ? '-' : '${(e.dayOneChange! * 100).toStringAsFixed(2)}%',
                          color: context.spColors.body,
                        ),
                      ])
                  .toList()
                  .expand((i) => i)
                  .toList();

              return GridView.count(
                crossAxisCount: 4,
                children: [
                  SpText.bodyMedium14('Data', color: context.spColors.body),
                  SpText.bodyMedium14('Valor', color: context.spColors.body),
                  SpText.bodyMedium14('% D-1', color: context.spColors.body),
                  SpText.bodyMedium14('% Total', color: context.spColors.body),
                  ...widgets,
                ],
              );
            },
            failure: () => const Text('Failure'),
          );
        }),
      ),
    );
  }
}
