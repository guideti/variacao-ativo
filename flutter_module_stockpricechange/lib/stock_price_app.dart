import 'package:flutter/material.dart';
import 'package:flutter_module_stockpricechange/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sp_design_system/sp_design_system.dart';

import 'home_page.dart';

class StockPriceApp extends StatelessWidget {
  const StockPriceApp(this._store, {super.key});

  final Store<AppState> _store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: _store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: SpTheme.light,
        darkTheme: SpTheme.dark,
        home: HomePage(),
      ),
    );
  }
}
