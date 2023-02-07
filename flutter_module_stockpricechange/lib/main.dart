import 'package:flutter/material.dart';
import 'package:flutter_module_stockpricechange/host_communication_handler.dart';
import 'package:flutter_module_stockpricechange/redux/store.dart';
import 'package:flutter_module_stockpricechange/stock_price_app.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR');
  final store = createReduxStore();
  initializeHostCommunicationHandler(store);
  runApp(StockPriceApp(store));
}
