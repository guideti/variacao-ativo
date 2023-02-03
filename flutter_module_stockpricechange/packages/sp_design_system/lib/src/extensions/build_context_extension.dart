import 'package:flutter/material.dart';
import 'package:sp_design_system/src/shared/sp_colors.dart';

extension BuildContextExtension on BuildContext {
  SpColors get fireColors => Theme.of(this).brightness == Brightness.light ? SpColors.light : SpColors.dark;
}
