import '../../../../data/usecases/usecases.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../factories.dart';

LoadChart makeRemoteLoadChartFactory() => RemoteLoadChart(
      httpClient: makeHttpAdapter(),
      url: makeApiUrl('v8/finance/chart'),
    );
