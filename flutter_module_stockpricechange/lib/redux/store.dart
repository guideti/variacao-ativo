import 'package:flutter_module_stockpricechange/data/trading_days_repository.dart';
import 'package:flutter_module_stockpricechange/pigeon.dart';
import 'package:flutter_module_stockpricechange/redux/app_state.dart';
import 'package:flutter_module_stockpricechange/redux/reducers.dart';
import 'package:flutter_module_stockpricechange/redux/repository_middleware.dart';
import 'package:redux/redux.dart';
import 'package:yahoo_finance_api/yahoo_finance_api.dart';

Store<AppState> createReduxStore() => Store<AppState>(
      appReducer,
      initialState: AppState(
        tradingDays: const [],
        dataStatus: DataStatus.initial,
        visualisationType: VisualisationType.chart,
      ),
      middleware: [
        RepositoryMiddleware(
          TradingDaysRepository(
            YahooFinanceApiClient(),
          ),
        ),
      ],
    );
