abstract class FetchCacheStorage {
  Future<dynamic> fetch(String name, {required String key});
  Future<List<dynamic>> fetchAll(String name);
}
