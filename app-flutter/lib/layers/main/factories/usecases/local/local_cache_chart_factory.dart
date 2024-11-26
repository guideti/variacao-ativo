import '../../../../data/usecases/usecases.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../factories.dart';

CacheChart makeRemoteCacheChartFactory() => LocalCacheChart(
      saveLocalCacheStorage: makeLocalStorageAdapter(),
      fetchCacheStorage: makeLocalStorageAdapter(),
      deleteCacheStorage: makeLocalStorageAdapter(),
    );
