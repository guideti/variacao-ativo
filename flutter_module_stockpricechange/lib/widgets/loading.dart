import 'package:flutter/material.dart';
import 'package:sp_design_system/sp_design_system.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: SpColors.green),
    );
  }
}
