import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sp_design_system/sp_design_system.dart';

class ChartView extends StatelessWidget {
  const ChartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              _CompanyLogo(),
              SizedBox(width: 8),
              _CompanyInfo(),
              Expanded(child: SizedBox(width: 8)),
              _CurrentPrice(),
            ],
          ),
          const SizedBox(height: 20),
          const _Chart(),
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
