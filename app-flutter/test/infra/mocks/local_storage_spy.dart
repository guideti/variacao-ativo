import 'package:ativo/layers/data/cache/storage/cache_storage.dart';
import 'package:mocktail/mocktail.dart';

class LocalStorageSpy extends Mock implements CacheStorage {
  LocalStorageSpy() {
    mockDelete();
    mockSave();
  }

  When mockDeleteCall() => when(() => delete('', key: any()));
  void mockDelete() => mockDeleteCall().thenAnswer((_) async => _);
  void mockDeleteError() => when(() => mockDeleteCall().thenThrow(Exception()));

  When mockSaveCall() => when(() => save('', key: any(), value: any()));
  void mockSave() => mockSaveCall().thenAnswer((_) async => _);
  void mockSaveError() => when(() => mockSaveCall().thenThrow(Exception()));

  When mockFetchCall() => when(() => fetch('', key: any()));
  void mockFetch(dynamic data) => mockFetchCall().thenAnswer((_) async => data);
  void mockFetchError() => when(() => mockFetchCall().thenThrow(Exception()));
}
