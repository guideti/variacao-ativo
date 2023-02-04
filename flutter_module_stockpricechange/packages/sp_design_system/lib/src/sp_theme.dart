import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sp_design_system/src/shared/sp_colors.dart';

class SpTheme {
  SpTheme._();

  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: SpColors.light.background,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.black),
      foregroundColor: Colors.black,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
      ),
    ),
  );

  static final ThemeData dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: SpColors.dark.background,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.white),
      foregroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
    ),
  );
}
