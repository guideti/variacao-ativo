import 'package:flutter/material.dart';
import 'package:flutter_module_stockpricechange/assets.dart';
import 'package:flutter_module_stockpricechange/extensions/formatting_extensions.dart';
import 'package:flutter_module_stockpricechange/models/trading_day_with_stats.dart';
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
        child: SvgPicture.asset(Assets.companyLogo),
      ),
    );
  }
}

class _CompanyInfo extends StatelessWidget {
  const _CompanyInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SpText.header('VALE3', color: context.spColors.header),
        const SizedBox(height: 2),
        SpText.bodyRegular12('Vale SA', color: context.spColors.bodyLight),
      ],
    );
  }
}

class _LatestPrice extends StatelessWidget {
  const _LatestPrice();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TradingDayWithStats>(
      converter: (store) => store.state.tradingDays.last,
      builder: (context, tradingDay) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SpText.header(
              (tradingDay.openPrice.toCurrency()),
              color: context.spColors.header,
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                if (tradingDay.thirtyDaysChange.isPositive()) SvgPicture.asset(Assets.arrowUp),
                if (tradingDay.thirtyDaysChange.isNegative()) SvgPicture.asset(Assets.arrowDown),
                SpText.bodyRegular12(
                  tradingDay.thirtyDaysChange == null
                      ? '-'
                      : '${tradingDay.thirtyDaysChange.toPercentage()} em 30 dias',
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
