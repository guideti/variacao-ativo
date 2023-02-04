import 'package:collection/collection.dart';
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
      child: BlocBuilder<StockHistoricalDataCubit, StockHistoricalDataState>(builder: (context, state) {
        return state.when(
          initial: () => Container(),
          loading: () => const Center(
            child: CircularProgressIndicator(color: SpColors.green),
          ),
          success: (historicalItems) {
            // TODO(lucas): Add scroll
            final rows = historicalItems.mapIndexed((index, element) {
              return TableRow(
                children: [
                  _TableItem((index + 1).toString()),
                  // TODO(lucas): Fix date formatting
                  _TableItem('01/01/2023'),
                  _TableItem(('R\$${element.openPrice.toStringAsFixed(2)}').toString()),
                  _TableItem(
                    (element.previousDayChange == null
                            ? '-'
                            : '${(element.previousDayChange! * 100).toStringAsFixed(2)}%')
                        .toString(),
                  ),
                  _TableItem(
                    (element.dayOneChange == null ? '-' : '${(element.dayOneChange! * 100).toStringAsFixed(2)}%')
                        .toString(),
                  ),
                ],
              );
            }).toList();

            return Table(
              border: TableBorder.all(
                color: context.spColors.border,
                width: 1,
                borderRadius: BorderRadius.circular(8),
              ),
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(3),
                2: FlexColumnWidth(2),
                3: FlexColumnWidth(2),
                4: FlexColumnWidth(2),
              },
              children: [
                TableRow(
                  decoration: const BoxDecoration(
                    color: SpColors.green,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: SpText.bodyMedium14('Dia', color: context.spColors.body)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: SpText.bodyMedium14('Data', color: context.spColors.body)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: SpText.bodyMedium14('Valor', color: context.spColors.body)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: SpText.bodyMedium14('% D-1', color: context.spColors.body)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: SpText.bodyMedium14('% Total', color: context.spColors.body)),
                    ),
                  ],
                ),
                ...rows,
              ],
            );
          },
          failure: () => const Text('Failure'),
        );
      }),
    );
  }
}

class _TableItem extends StatelessWidget {
  const _TableItem(this.value);

  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: SpText.bodyRegular14(value, color: context.spColors.body)),
    );
  }
}
