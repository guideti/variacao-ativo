import 'package:flutter_module_stockpricechange/pigeon/api.dart';
import 'package:flutter_module_stockpricechange/redux/actions.dart';
import 'package:flutter_module_stockpricechange/redux/app_state.dart';
import 'package:redux/redux.dart';

void initializeHostCommunicationHandler(Store<AppState> store) =>
    FlutterStockApi.setup(HostCommunicationHandler(store));

// Class responsible for listening to host events and changing the visualisation type
class HostCommunicationHandler extends FlutterStockApi {
  HostCommunicationHandler(this._store);

  final Store<AppState> _store;

  @override
  void chooseVisualisationType(Visualisation visualisation) {
    _store.dispatch(ChangeVisualisationAction(visualisation.visualisationType));
  }
}
