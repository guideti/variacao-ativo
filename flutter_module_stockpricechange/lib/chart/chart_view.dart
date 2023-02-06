import 'package:flutter/material.dart';
import 'package:flutter_module_stockpricechange/chart/chart.dart';
import 'package:flutter_module_stockpricechange/models/trading_day.dart';
import 'package:flutter_module_stockpricechange/redux/actions.dart';
import 'package:flutter_module_stockpricechange/redux/app_state.dart';
import 'package:flutter_module_stockpricechange/stock_info.dart';
import 'package:flutter_module_stockpricechange/widgets/error_with_retry.dart';
import 'package:flutter_module_stockpricechange/widgets/loading.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:sp_design_system/sp_design_system.dart';

class ChartView extends StatelessWidget {
  const ChartView({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      onInit: (store) => store.dispatch(LoadTradingDaysAction()),
      converter: (store) => store.state,
      builder: (context, state) {
        switch (state.dataStatus) {
          case DataStatus.initial:
            return Container();
          case DataStatus.loading:
            return const Loading();
          case DataStatus.loaded:
            return const _Content();
          case DataStatus.failure:
            return const ErrorWithRetry();
        }
      },
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StockInfo(),
            const SizedBox(height: 20),
            orientation.isPortrait
                ? const AspectRatio(
                    aspectRatio: 1,
                    child: Chart(),
                  )
                : const Expanded(
                    child: Chart(),
                  ),
            const SizedBox(height: 28),
            if (orientation.isPortrait && screenBigEnoughForStatistics(context)) ...[
              const _Statistics(),
              const SizedBox(height: 16),
            ]
          ],
        ),
      );
    });
  }

  bool screenBigEnoughForStatistics(BuildContext context) => MediaQuery.of(context).size.height >= 700;
}

class _Statistics extends StatelessWidget {
  const _Statistics();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TradingDay>(
        converter: (store) => store.state.tradingDays.last,
        builder: (context, day) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TODO(lucas): Fix formatting
              Row(
                children: [
                  SpText.bodyMedium14('Variação do Dia', color: context.spColors.body),
                  const SizedBox(width: 8),
                  SpText.bodyRegular12('/ ${DateFormat.MMMd('pt_BR').format(day.day)}',
                      color: context.spColors.bodyLight),
                ],
              ),
              const SizedBox(height: 16),
              _StatRow(title: 'Abertura', value: 'R\$${day.openPrice.toStringAsFixed(2)}'),
              const SizedBox(height: 12),
              const _Divider(),
              const SizedBox(height: 12),
              _StatRow(title: 'Fechamento', value: 'R\$${day.closePrice.toStringAsFixed(2)}'),
              const SizedBox(height: 12),
              const _Divider(),
              const SizedBox(height: 12),
              _StatRow(title: 'Máximo', value: 'R\$${day.highPrice.toStringAsFixed(2)}'),
              const SizedBox(height: 12),
              const _Divider(),
              const SizedBox(height: 12),
              _StatRow(title: 'Mínimo', value: 'R\$${day.lowPrice.toStringAsFixed(2)}'),
              const SizedBox(height: 12),
            ],
          );
        });
  }
}

class _StatRow extends StatelessWidget {
  const _StatRow({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SpText.bodyRegular14(title, color: context.spColors.bodyLight),
        SpText.bodyMedium14(value, color: context.spColors.body),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: context.spColors.border,
    );
  }
}

extension on Orientation {
  bool get isPortrait => this == Orientation.portrait;
}
