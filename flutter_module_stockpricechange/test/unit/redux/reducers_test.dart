import 'package:collection/collection.dart';
import 'package:flutter_module_stockpricechange/extensions/formatting_extensions.dart';
import 'package:flutter_module_stockpricechange/pigeon/api.dart';
import 'package:flutter_module_stockpricechange/redux/actions.dart';
import 'package:flutter_module_stockpricechange/redux/app_state.dart';
import 'package:flutter_module_stockpricechange/redux/reducers.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../factories.dart';

void main() {
  test(
    'GIVEN visualisationType is TABLE '
    'WHEN ChangeVisualisationAction is triggered with CHART '
    'THEN visualisationType becomes CHART',
    () {
      final state = buildAppState(visualisationType: VisualisationType.table);
      final action = ChangeVisualisationAction(VisualisationType.chart);

      final newState = appReducer(state, action);

      expect(newState.visualisationType, VisualisationType.chart);
    },
  );

  test(
    'GIVEN visualisationType is CHART '
    'WHEN ChangeVisualisationAction is triggered with TABLE '
    'THEN visualisationType becomes TABLE',
    () {
      final state = buildAppState(visualisationType: VisualisationType.chart);
      final action = ChangeVisualisationAction(VisualisationType.table);

      final newState = appReducer(state, action);

      expect(newState.visualisationType, VisualisationType.table);
    },
  );

  test(
    'WHEN LoadTradingDaysAction is triggered '
    'THEN dataStatus becomes LOADING',
    () {
      final state = buildAppState(dataStatus: DataStatus.initial);
      final action = LoadTradingDaysAction();

      final newState = appReducer(state, action);

      expect(newState.dataStatus, DataStatus.loading);
    },
  );

  test(
    'GIVEN app already has data'
    'WHEN LoadTradingDaysAction is triggered '
    'THEN nothing happens',
    () {
      final state = buildAppState(tradingDays: buildListOfTradingDayWithStats(2));
      final action = LoadTradingDaysAction();

      final newState = appReducer(state, action);

      expect(newState, state);
    },
  );

  test(
    'WHEN TradingDaysNotLoadedAction is triggered '
    'THEN dataStatus becomes FAILURE',
    () {
      final state = buildAppState();
      final action = TradingDaysNotLoadedAction();

      final newState = appReducer(state, action);

      expect(newState.dataStatus, DataStatus.failure);
    },
  );

  test(
    'WHEN TradingDaysLoadedAction is triggered '
    'AND the list of tradingDays is empty'
    'THEN dataStatus becomes FAILURE',
    () {
      final state = buildAppState();
      final action = TradingDaysLoadedAction([]);

      final newState = appReducer(state, action);

      expect(newState.dataStatus, DataStatus.failure);
    },
  );

  test(
    'WHEN TradingDaysLoadedAction is triggered '
    'THEN it computes the stats correctly',
    () {
      final openPrices = <double>[1, 1.1, 1.05, 1.9];
      final expectedPreviousDayChange = ['-', '10,00%', '-4,55%', '80,95%'];
      final expectedThirdDayChange = ['-', '10,00%', '5,00%', '90,00%'];

      final state = buildAppState();
      final action = TradingDaysLoadedAction(buildListOfTradingDays(openPrices));

      final newState = appReducer(state, action);

      expect(newState.dataStatus, DataStatus.loaded);

      newState.tradingDays.forEachIndexed((index, day) {
        expect(day.previousDayChange.toPercentage(), expectedPreviousDayChange[index]);
        expect(day.thirtyDaysChange.toPercentage(), expectedThirdDayChange[index]);
      });
    },
  );
}
