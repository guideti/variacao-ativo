import 'package:dartz/dartz.dart';
import 'package:variacao_ativa_flutter/core/network/models/error.dart';
import 'package:variacao_ativa_flutter/core/network/models/success.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/data/datasources/variacao_ativo_datasource.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/data/models/chart_model.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/domain/entities/chart_entity.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/domain/repositories/ivariacao_ativo_repository.dart';

class VariacaoAtivoRepository implements IVariacaoAtivoRepository {
  final VariacaoAtivoDataSource _variacaoDataSource;

  VariacaoAtivoRepository(this._variacaoDataSource);
  @override
  Future<Either<Erro, ChartEntity>> getActiveVariation({
    required String activeName,
  }) async {
    final result =
        await _variacaoDataSource.getActiveVariation(activeName: activeName);
    if (result is Success) {
      try {
        final chartList = ChartModel.fromJson(Map.from(result.data));
        return Right(chartList);
      } catch (e) {
        return Left(Erro(statusMessage: 'Erro ao decodar'));
      }
    }
    return Left(Erro(statusMessage: result.statusMessage));
  }
}
