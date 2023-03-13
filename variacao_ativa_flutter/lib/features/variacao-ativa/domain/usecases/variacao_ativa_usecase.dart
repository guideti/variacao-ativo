import 'package:dartz/dartz.dart';
import 'package:variacao_ativa_flutter/core/network/models/error.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/domain/entities/chart_entity.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/domain/repositories/ivariacao_ativa_repository.dart';

class VariacaoAtivaUseCase {
  final IVariacaoAtivaRepository _variacaoAtivaRepository;

  VariacaoAtivaUseCase(this._variacaoAtivaRepository);

  Future<Either<Erro, ChartEntity>> getActiveVariation({
    required String activeName,
  }) async {
    return _variacaoAtivaRepository.getActiveVariation(activeName: activeName);
  }
}
