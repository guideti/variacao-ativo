import 'package:base_app/src/asset_change/presentation/pages/asset_change_page.dart';
import 'package:base_app/src/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:load/load.dart';

void main() {
  initializeDi(GetIt.instance);
  runApp(LoadingProvider(
    themeData: LoadingThemeData(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AssetChangePage(),
    );
  }
}
