import 'package:flutter/material.dart';
import 'package:sp_design_system/sp_design_system.dart';

import 'home_page.dart';

class StockPriceApp extends StatelessWidget {
  const StockPriceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: SpTheme.light,
      darkTheme: SpTheme.dark,
      home: const HomePage(),
    );
  }
}
