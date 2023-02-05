import 'package:flutter_module_stockpricechange/pigeon.dart';
import 'package:flutter_module_stockpricechange/redux/actions.dart';
import 'package:flutter_module_stockpricechange/redux/app_state.dart';
import 'package:redux/redux.dart';

void initializeHostApiHandler(Store<AppState> store) => FlutterStockApi.setup(HostApiHandler(store));

class HostApiHandler extends FlutterStockApi {
  HostApiHandler(this._store);

  final Store<AppState> _store;

  @override
  void displayStockData(Visualisation visualisation) {
    _store.dispatch(ChangeVisualisationAction(visualisation.visualisationType));
  }
}
