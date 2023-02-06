import 'package:flutter/material.dart';
import 'package:flutter_module_stockpricechange/chart/chart.dart';
import 'package:flutter_module_stockpricechange/redux/actions.dart';
import 'package:flutter_module_stockpricechange/redux/app_state.dart';
import 'package:flutter_module_stockpricechange/stock_info.dart';
import 'package:flutter_module_stockpricechange/widgets/error_with_retry.dart';
import 'package:flutter_module_stockpricechange/widgets/loading.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SpText.bodyMedium14('Statistics', color: context.spColors.body),
        const SizedBox(height: 16),
        const _StatRow(title: 'Previous Close', value: '\$1,800'),
        const SizedBox(height: 16),
        const _Divider(),
        const SizedBox(height: 16),
        const _StatRow(title: 'Opening Price', value: '\$1,860'),
        const SizedBox(height: 16),
        const _Divider(),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SpText.bodyRegular14('24H Returns %', color: context.spColors.bodyLight),
            // TODO(lucas): Use widget for variable percentage
            Row(
              children: [
                // TODO(lucas): Use constant for assets
                SvgPicture.asset('assets/arrow_up.svg'),
                SpText.bodyRegular12('2.35%', color: SpColors.green),
              ],
            )
          ],
        ),
      ],
    );
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
