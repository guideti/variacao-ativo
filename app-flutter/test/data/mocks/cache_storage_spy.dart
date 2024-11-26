import 'package:ativo/layers/data/cache/storage/cache_storage.dart';

import 'package:mocktail/mocktail.dart';

class CacheStorageSpy extends Mock implements CacheStorage {
  CacheStorageSpy() {
    mockDelete();
    mockSave();
  }

  When mockFetchCall() => when(() => fetch('test', key: any()));
  void mockFetch(dynamic json) => mockFetchCall().thenAnswer((_) async => json);
  void mockFetchError() => mockFetchCall().thenThrow(Exception());

  When mockDeleteCall() => when(() => delete('test', key: any()));
  void mockDelete() => mockDeleteCall().thenAnswer((_) async => _);
  void mockDeleteError() => mockDeleteCall().thenThrow(Exception());

  When mockSaveCall() => when(() => save('test', key: any(named: 'key'), value: any(named: 'value')));
  void mockSave() => mockSaveCall().thenAnswer((_) async => _);
  void mockSaveError() => mockSaveCall().thenThrow(Exception());
}
