import '../../../../../commons/commons.dart';
import '../../domain.dart';

import 'package:dartz/dartz.dart';

abstract class LoadChart {
  Future<Either<FailureException, ChartEntity>> fetch(String symbol, {required LoadChartParams params});
}

class LoadChartParams {
  LoadChartParams({
    required this.periodOne,
    required this.periodTwo,
    required this.interval,
  });

  final int periodOne;
  final int periodTwo;
  final String interval;
}
