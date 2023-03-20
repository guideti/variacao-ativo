abstract class SaveCacheStorage {
  Future<void> save(
    String table, {
    required String key,
    required String value,
  });

  Future<void> saveAll(
    String table, {
    required List<Map<String, String>> values,
  });
}
