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
            children: [
              Column(
                children: [
                  SpText.header('SBUX', color: context.spColors.header),
                  SpText.bodyRegular12('Starbucks', color: context.spColors.bodyLight),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
