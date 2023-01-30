import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_repository/stock_repository.dart';

import 'stock_historical_data_state.dart';

class StockHistoricalDataCubit extends Cubit<StockHistoricalDataState> {
  StockHistoricalDataCubit(this._stockRepository) : super(const StockHistoricalDataState.initial());

  final StockRepository _stockRepository;

  Future<void> fetchData() async {
    emit(const StockHistoricalDataState.loading());

    print('Will fetch');

    final dailyPrices = await _stockRepository.getStockPriceData();

    print(dailyPrices);

    emit(const StockHistoricalDataState.success());
  }
}
