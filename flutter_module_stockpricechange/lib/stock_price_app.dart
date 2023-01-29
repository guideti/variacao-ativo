import 'package:flutter/material.dart';

import 'ui/home_page.dart';

class StockPriceApp extends StatelessWidget {
  const StockPriceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
