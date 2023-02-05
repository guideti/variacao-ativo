import 'package:flutter_module_stockpricechange/redux/app_state.dart';
import 'package:flutter_module_stockpricechange/redux/reducers.dart';
import 'package:flutter_module_stockpricechange/redux/repository_middleware.dart';
import 'package:redux/redux.dart';
import 'package:stock_repository/stock_repository.dart';

Store<AppState> createReduxStore() => Store<AppState>(
      appReducer,
      initialState: AppState(
        tradingDays: const [],
        isLoading: false,
        failed: false,
      ),
      middleware: [
        RepositoryMiddleware(StockRepository()),
      ],
    );
