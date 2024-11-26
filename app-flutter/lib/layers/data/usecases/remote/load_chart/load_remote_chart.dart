import 'package:dartz/dartz.dart';

import '../../../../../../commons/commons.dart';
import '../../../../domain/entities/entities.dart';
import '../../../../domain/usecases/usecases.dart';
import '../../../data.dart';

class RemoteLoadChart implements LoadChart {
  final HttpClient httpClient;
  final String url;

  RemoteLoadChart({
    required this.httpClient,
    required this.url,
  });

  @override
  Future<Either<FailureException, ChartEntity>> fetch(String symbol, {required LoadChartParams params}) async {
    try {
      final httpResponse = await httpClient.request(
        url: "$url/$symbol?period1=${params.periodOne}&period2=${params.periodTwo}&interval=${params.interval}",
        method: 'get',
      );

      var chart = httpResponse["chart"];

      return Right(ChartModelRemote.fromJson(chart).toEntity());
    } on InternetNotFoundRequestException catch (error) {
      return Left(
        FailureException(
          message: error.message,
          code: error.code,
        ),
      );
    } on BadRequestException catch (error) {
      return Left(
        FailureException(
          message: error.message,
          code: error.code,
          errors: error.errors,
        ),
      );
    } on ServerException catch (error) {
      return Left(
        FailureException(
          message: error.message,
          code: error.code,
        ),
      );
    }
  }
}
