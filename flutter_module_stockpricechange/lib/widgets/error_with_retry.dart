import 'package:flutter/material.dart';
import 'package:sp_design_system/sp_design_system.dart';

class ErrorWithRetry extends StatelessWidget {
  const ErrorWithRetry({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpText.header('Something wrong happened.\nPlease try again', color: context.spColors.body),
            const SizedBox(height: 24),
            // TODO(lucas): Customize button and handle presses
            OutlinedButton(onPressed: () {}, child: const Text('Retry')),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
