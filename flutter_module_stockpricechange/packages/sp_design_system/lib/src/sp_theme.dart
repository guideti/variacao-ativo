import 'package:flutter/material.dart';
import 'package:sp_design_system/src/shared/sp_colors.dart';

class SpTheme {
  SpTheme._();

  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: SpColors.light.background,
  );

  static final ThemeData dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: SpColors.dark.background,
  );
}
