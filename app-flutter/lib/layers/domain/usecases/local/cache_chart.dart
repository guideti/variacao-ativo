import 'package:dartz/dartz.dart';

import '../../../../commons/exceptions/exceptions.dart';
import '../../domain.dart';

abstract class CacheChart {
  Future<Either<FailureException, void>> save(String key, ChartEntity entity);
  Future<Either<FailureException, ChartEntity?>> fetch(String key);
  Future<Either<FailureException, void>> delete(String key);
}
