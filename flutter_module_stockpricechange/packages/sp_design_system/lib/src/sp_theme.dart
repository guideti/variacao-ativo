import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sp_design_system/src/shared/sp_colors.dart';
import 'package:sp_design_system/src/shared/sp_material_colors.dart';

class SpTheme {
  SpTheme._();

  static final ThemeData light = ThemeData(
    primarySwatch: SpMaterialColors.green,
    scaffoldBackgroundColor: SpColors.light.background,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.black),
      foregroundColor: Colors.black,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: SpMaterialColors.green.shade700,
      ),
    ),
  );

  static final ThemeData dark = ThemeData.dark().copyWith(
    primaryColor: SpColors.green,
    scaffoldBackgroundColor: SpColors.dark.background,
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.white),
      foregroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: SpMaterialColors.green.shade700,
      ),
    ),
  );
}
