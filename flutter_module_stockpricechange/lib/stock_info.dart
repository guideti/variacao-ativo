import 'package:flutter/material.dart';
import 'package:flutter_module_stockpricechange/models/trading_day.dart';
import 'package:flutter_module_stockpricechange/redux/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sp_design_system/sp_design_system.dart';

class StockInfo extends StatelessWidget {
  const StockInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        _CompanyLogo(),
        SizedBox(width: 8),
        _CompanyInfo(),
        Expanded(child: SizedBox(width: 8)),
        _LatestPrice(),
      ],
    );
  }
}

class _CompanyLogo extends StatelessWidget {
  const _CompanyLogo();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: context.spColors.border),
      ),
      child: Center(
        child: SvgPicture.asset(
          'assets/starbucks.svg',
        ),
      ),
    );
  }
}

class _CompanyInfo extends StatelessWidget {
  const _CompanyInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SpText.header('SBUX', color: context.spColors.header),
        const SizedBox(height: 2),
        SpText.bodyRegular12('Starbucks', color: context.spColors.bodyLight),
      ],
    );
  }
}

class _LatestPrice extends StatelessWidget {
  const _LatestPrice();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TradingDay>(
      converter: (store) => store.state.tradingDays.last,
      builder: (context, tradingDay) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // TODO(lucas): Format currency and percentage using NumberFormat
            SpText.header(
              ('R\$${tradingDay.openPrice.toStringAsFixed(2)}').toString(),
              color: context.spColors.header,
            ),
            const SizedBox(height: 2),
            // TODO(lucas): Use widget for variable percentage
            Row(
              children: [
                if (tradingDay.thirtyDaysChange.isPositive()) SvgPicture.asset('assets/arrow_up.svg'),
                if (tradingDay.thirtyDaysChange.isNegative()) SvgPicture.asset('assets/arrow_down.svg'),
                SpText.bodyRegular12(
                  '${(tradingDay.thirtyDaysChange! * 100).toStringAsFixed(2)}% em 30 dias',
                  color: tradingDay.thirtyDaysChange.isPositive()
                      ? SpColors.green
                      : tradingDay.thirtyDaysChange.isNegative()
                          ? SpColors.red
                          : context.spColors.body,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

extension on double? {
  bool isPositive() => this != null && this! > 0;
  bool isNegative() => this != null && this! < 0;
}
