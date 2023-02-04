import 'package:flutter/material.dart';
import 'package:sp_design_system/sp_design_system.dart';

class ChartView extends StatelessWidget {
  const ChartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            children: const [
              _CompanyInfo(),
              Expanded(child: SizedBox(width: 8)),
              _CurrentPrice(),
            ],
          ),
          const SizedBox(height: 20),
          const _Chart(),
        ],
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
        SpText.bodyRegular12('^ 2.35% in last 7 days', color: SpColors.accentGreen),
      ],
    );
  }
}

class _Chart extends StatelessWidget {
  const _Chart();

  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 2,
      child: Placeholder(),
    );
  }
}
