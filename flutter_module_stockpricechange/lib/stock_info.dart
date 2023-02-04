import 'package:flutter/material.dart';
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
        _CurrentPrice(),
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

class _CurrentPrice extends StatelessWidget {
  const _CurrentPrice();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SpText.header('\$1,863.02', color: context.spColors.header),
        const SizedBox(height: 2),
        // TODO(lucas): Use widget for variable percentage
        Row(
          children: [
            SvgPicture.asset('assets/arrow_up.svg'),
            SpText.bodyRegular12('2.35% in last 7 days', color: SpColors.green),
          ],
        ),
      ],
    );
  }
}
