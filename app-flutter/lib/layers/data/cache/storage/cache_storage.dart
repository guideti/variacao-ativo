abstract class CacheStorage {
  Future<dynamic> fetch(String table, {required String key});
  Future<void> delete(String table, {required String key});
  Future<void> save(String table, {required String key, required dynamic value});
}
