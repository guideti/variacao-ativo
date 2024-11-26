import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../../../../../commons/commons.dart';
import '../../../../domain/entities/entities.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../../cache/cache.dart';

class LocalCacheChart implements CacheChart {
  final SaveCacheStorage saveLocalCacheStorage;
  final DeleteCacheStorage deleteCacheStorage;
  final FetchCacheStorage fetchCacheStorage;
  final String table = 'chart';

  LocalCacheChart({
    required this.saveLocalCacheStorage,
    required this.deleteCacheStorage,
    required this.fetchCacheStorage,
  });

  @override
  Future<Either<FailureException, void>> save(String key, ChartEntity entity) async {
    try {
      var json = toJson(entity);
      await saveLocalCacheStorage.save(table, key: key, value: json);
      return const Right(null);
    } catch (error) {
      throw CacheException(error.toString());
    }
  }

  @override
  Future<Either<FailureException, ChartEntity?>> fetch(String key) async {
    try {
      var value = await fetchCacheStorage.fetch(table, key: key);
      if (value != null) {
        if (value is String && value.isValid()) {
          return Right(fromJson(value));
        }
      }

      return const Right(null);
    } catch (error) {
      throw CacheException(error.toString());
    }
  }

  @override
  Future<Either<FailureException, void>> delete(String key) async {
    try {
      await deleteCacheStorage.delete(table, key: key);
      return const Right(null);
    } catch (error) {
      throw CacheException(error.toString());
    }
  }

  String toJson(ChartEntity entity) {
    Map<String, dynamic> json = {
      "symbol": entity.symbol,
      "timestamp": entity.timestamp.map((e) => e.millisecondsSinceEpoch).toList(),
      "open": entity.open.toList(),
    };

    return jsonEncode(json);
  }

  ChartEntity fromJson(String value) {
    var json = jsonDecode(value);

    return ChartEntity(
      symbol: json["symbol"],
      timestamp: (json["timestamp"] as List).map((e) => DateTime.fromMillisecondsSinceEpoch(e)).toList(),
      open: (json["open"] as List).map((e) => e as double).toList(),
    );
  }
}
