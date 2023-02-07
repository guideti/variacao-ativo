import 'package:flutter_module_stockpricechange/extensions/formatting_extensions.dart';
import 'package:flutter_module_stockpricechange/models/trading_day_with_stats.dart';
import 'package:flutter_module_stockpricechange/widgets/stock_info.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../factories.dart';
import '../extensions.dart';

void main() {
  group('StockInfo', () {
    final tradingDays = [
      TradingDayWithStats(tradingDay: buildTradingDay()),
      TradingDayWithStats(
        tradingDay: buildTradingDay(),
        previousDayChange: 0.1,
        thirtyDaysChange: 0.1,
      ),
    ];
    final appState = buildAppState(tradingDays: tradingDays);

    testWidgets('it displays the company name and ticker', (tester) async {
      await tester.pumpMockApp(const StockInfo(), state: appState);

      expect(find.text('VALE3'), findsOneWidget);
      expect(find.text('Vale SA'), findsOneWidget);
    });

    testWidgets('it displays the latest price and the 30 day change', (tester) async {
      await tester.pumpMockApp(const StockInfo(), state: appState);

      expect(find.text('R\$ 1,00'), findsOneWidget);
      expect(find.text('10,00% em 30 dias'), findsOneWidget);
    });
  });
}
