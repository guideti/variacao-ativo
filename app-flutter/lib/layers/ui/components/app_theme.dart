import 'package:flutter/material.dart';

ThemeData get appThemeLight {
  var theme = _makeAppTheme();

  var themeData = theme.copyWith(
    brightness: Brightness.light,
    appBarTheme: theme.appBarTheme.copyWith(
      iconTheme: theme.appBarTheme.iconTheme?.copyWith(color: Colors.black),
      elevation: 2.0,
    ),
    iconTheme: theme.iconTheme.copyWith(color: Colors.white),
    colorScheme: theme.colorScheme.copyWith(
      brightness: Brightness.light,
    ),
    textTheme: theme.textTheme.apply(
      displayColor: Colors.black,
      bodyColor: Colors.black,
      decorationColor: Colors.black,
    ),
    bottomNavigationBarTheme: theme.bottomNavigationBarTheme.copyWith(
      unselectedItemColor: Colors.grey[500],
    ),
  );

  return themeData;
}

ThemeData get appThemeDark {
  var theme = _makeAppTheme();

  var backgroundBlack = const Color(0xFF212121);

  var themeData = theme.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: backgroundBlack,
    colorScheme: theme.colorScheme.copyWith(
      brightness: Brightness.dark,
      secondary: theme.primaryColorLight,
    ),
    appBarTheme: theme.appBarTheme.copyWith(
      backgroundColor: backgroundBlack,
      actionsIconTheme: theme.appBarTheme.actionsIconTheme?.copyWith(
        color: theme.primaryColorLight,
      ),
      titleTextStyle: theme.appBarTheme.titleTextStyle?.copyWith(
        color: Colors.grey[400],
      ),
    ),
    bottomNavigationBarTheme: theme.bottomNavigationBarTheme.copyWith(
      backgroundColor: backgroundBlack,
      unselectedItemColor: Colors.grey[400],
    ),
    dataTableTheme: theme.dataTableTheme.copyWith(
      headingTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.grey[400],
      ),
      dataTextStyle: TextStyle(
        color: Colors.grey[400],
      ),
      dividerThickness: 0.0,
    ),
    listTileTheme: theme.listTileTheme.copyWith(
      textColor: Colors.grey[400],
    ),
  );

  return themeData;
}

ThemeData _makeAppTheme() {
  const primaryColor = Color.fromRGBO(64, 64, 122, 1.0);
  const primaryColorDark = Color.fromRGBO(44, 44, 84, 1.0);
  const primaryColorLight = Color.fromRGBO(112, 111, 211, 1.0);

  const secondaryColor = Color.fromRGBO(56, 56, 56, 1);

  const backgroundColor = Color.fromRGBO(241, 242, 246, 1);
  const dividerColor = Colors.grey;
  final disabledColor = Colors.grey[400];

  final MaterialColor primaryColorMaterial = MaterialColor(
    primaryColor.value,
    {
      50: primaryColor.withOpacity(.5),
      100: primaryColor.withOpacity(.6),
      200: primaryColor.withOpacity(.7),
      300: primaryColor.withOpacity(.8),
      400: primaryColor.withOpacity(.9),
      500: primaryColor.withOpacity(1),
      600: primaryColor.withOpacity(1),
      700: primaryColor.withOpacity(1),
      800: primaryColor.withOpacity(1),
      900: primaryColor.withOpacity(1),
    },
  );

  const appBarThemeData = AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.white,
    ),
  );

  const floatingActionButtonThemeData = FloatingActionButtonThemeData(
    foregroundColor: Colors.white,
    extendedTextStyle: TextStyle(
      color: Colors.white,
    ),
  );

  const snackBarThemeData = SnackBarThemeData(
    actionTextColor: Colors.white,
    contentTextStyle: TextStyle(
      color: Colors.white,
    ),
  );

  const bottomSheetThemeData = BottomSheetThemeData(
    backgroundColor: backgroundColor,
  );

  var elevatedButtonThemeData = ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all<TextStyle?>(
        const TextStyle(color: Colors.white),
      ),
    ),
  );

  return ThemeData(
    useMaterial3: true,
    primaryColor: primaryColor,
    primaryColorDark: primaryColorDark,
    primaryColorLight: primaryColorLight,
    primarySwatch: primaryColorMaterial,
    disabledColor: disabledColor,
    dividerColor: dividerColor,
    scaffoldBackgroundColor: backgroundColor,
    floatingActionButtonTheme: floatingActionButtonThemeData,
    snackBarTheme: snackBarThemeData,
    appBarTheme: appBarThemeData,
    bottomSheetTheme: bottomSheetThemeData,
    elevatedButtonTheme: elevatedButtonThemeData,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: primaryColor,
      secondary: secondaryColor,
      onSecondary: secondaryColor,
      error: Colors.redAccent,
      onError: Colors.redAccent,
      background: backgroundColor,
      onBackground: backgroundColor,
      surface: primaryColorLight,
      onSurface: primaryColorLight,
    ),
  );
}
