import 'package:pigeon/pigeon.dart';

enum VisualisationType { historical, chart }

// This class is needed because Pigeon only supports enums as class properties
class Visualisation {
  Visualisation(this.visualisationType);

  final VisualisationType visualisationType;
}

@FlutterApi()
abstract class FlutterStockApi {
  void displayStockData(Visualisation visualisation);
}
