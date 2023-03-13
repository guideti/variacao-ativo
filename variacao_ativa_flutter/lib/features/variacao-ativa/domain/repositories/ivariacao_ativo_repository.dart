import 'package:dartz/dartz.dart';
import 'package:variacao_ativa_flutter/core/network/models/error.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/domain/entities/chart_entity.dart';

abstract class IVariacaoAtivoRepository {
  Future<Either<Erro, ChartEntity>> getActiveVariation(
      {required String activeName});
}
