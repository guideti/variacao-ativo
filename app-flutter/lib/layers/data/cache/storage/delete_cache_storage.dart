abstract class DeleteCacheStorage {
  Future<void> delete(String table, {required String key});
  Future<void> deleteAll(String table);
}
