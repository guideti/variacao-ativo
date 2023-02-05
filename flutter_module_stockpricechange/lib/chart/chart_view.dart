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
        if (state.isLoading) {
          return const Loading();
        }
        if (state.failed || state.tradingDays.isEmpty) {
          return const ErrorWithRetry();
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const StockInfo(),
              const SizedBox(height: 20),
              const AspectRatio(
                aspectRatio: 1,
                child: Chart(),
              ),
              const SizedBox(height: 28),
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
              const SizedBox(height: 16),
            ],
          ),
        );
      },
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
