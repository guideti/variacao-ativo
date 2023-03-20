import 'dart:async';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../data/data.dart';

class LocalStorageAdapter implements SaveCacheStorage, FetchCacheStorage, DeleteCacheStorage {
  LocalStorageAdapter() {
    _init();
  }

  final Completer<Directory> _instance = Completer<Directory>();

  Future<void> _init() async {
    _instance.complete(Platform.isIOS ? await getLibraryDirectory() : await getApplicationDocumentsDirectory());
    Directory appDocumentDir = await _instance.future;

    Hive.init(appDocumentDir.path);
  }

  @override
  Future<void> save(
    String table, {
    required String key,
    required String value,
  }) async {
    Box box = await getBox(table);
    await box.put(key, value);
  }

  @override
  Future<void> saveAll(
    String table, {
    required List<Map<String, String>> values,
  }) async {
    Box box = await getBox(table);

    await Future.forEach(values, (Map<String, String> map) async {
      await box.put(map.keys, map.values);
    });
  }

  @override
  Future<void> delete(
    String table, {
    required String key,
  }) async {
    Box box = await getBox(table);
    await box.delete(key);
  }

  @override
  Future<void> deleteAll(String table) async {
    Box box = await getBox(table);
    await box.deleteAll(box.keys);
  }

  @override
  Future<dynamic> fetch(
    String table, {
    required String key,
  }) async {
    Box box = await getBox(table);
    return box.get(key);
  }

  @override
  Future<List<dynamic>> fetchAll(String table) async {
    Box box = await getBox(table);
    return box.values.toList();
  }

  Future<Box> getBox(String box) async {
    if (Hive.isBoxOpen(box)) {
      return Hive.box(box);
    } else {
      Directory appDocumentDir = await _instance.future;
      return await Hive.openBox(box, path: appDocumentDir.path);
    }
  }
}
