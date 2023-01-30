import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_module_stockpricechange/historical/historical_data_item.dart';
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

    final historicalItems = <HistoricalDataItem>[];

    dailyPrices.forEachIndexed((index, element) {
      if (index == 0) {
        historicalItems.add(HistoricalDataItem(timestamp: element.timestamp, openPrice: element.open));
      } else {
        final firstItem = historicalItems.first;
        final dayOneChange = (element.open - firstItem.openPrice) / firstItem.openPrice;

        final previousItem = historicalItems.last;
        final previousDayChange = (element.open - previousItem.openPrice) / previousItem.openPrice;

        historicalItems.add(HistoricalDataItem(
          timestamp: element.timestamp,
          openPrice: element.open,
          dayOneChange: dayOneChange,
          previousDayChange: previousDayChange,
        ));
      }
    });

    emit(StockHistoricalDataState.success(historicalItems));
  }
}

extension ExtendedIterable<E> on Iterable<E> {
  void forEachIndexed(void Function(int index, E element) f) {
    var i = 0;
    forEach((e) => f(i++, e));
  }
}
