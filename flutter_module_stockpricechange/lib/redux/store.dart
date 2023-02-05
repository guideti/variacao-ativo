import 'package:flutter_module_stockpricechange/models/trading_day.dart';
import 'package:flutter_module_stockpricechange/redux/app_state.dart';
import 'package:flutter_module_stockpricechange/redux/reducers.dart';
import 'package:flutter_module_stockpricechange/redux/repository_middleware.dart';
import 'package:redux/redux.dart';

Store<AppState> createReduxStore() => Store<AppState>(
      appReducer,
      initialState: AppState(
        tradingDays: [
          TradingDay(
            day: DateTime(2023, 2),
            openPrice: 25.5,
          ),
          TradingDay(
            day: DateTime(2023, 2, 2),
            openPrice: 25.5,
          ),
          TradingDay(
            day: DateTime(2023, 2, 3),
            openPrice: 25.5,
          ),
          TradingDay(
            day: DateTime(2023, 2, 4),
            openPrice: 25.5,
          ),
        ],
        isLoading: false,
        failed: false,
      ),
      middleware: [
        RepositoryMiddleware(),
      ],
    );
