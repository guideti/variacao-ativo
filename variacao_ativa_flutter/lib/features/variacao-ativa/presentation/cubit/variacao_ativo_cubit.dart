import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/domain/entities/chart_entity.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/domain/usecases/variacao_ativo_usecase.dart';

part 'variacao_ativo_state.dart';

class VariacaoAtivoCubit extends Cubit<VariacaoAtivoState> {
  VariacaoAtivoCubit(this._variacaoAtivaUseCase)
      : super(VariacaoAtivoInitial());

  final VariacaoAtivoUseCase _variacaoAtivaUseCase;

  Future<void> getActiveVariation({required String activeName}) async {
    emit(VariacaoAtivoLoading());
    final result =
        await _variacaoAtivaUseCase.getActiveVariation(activeName: activeName);

    result.fold(
      (error) => emit(
        VariacaoAtivoError(
            errorMessage: error.statusMessage ?? 'Erro não reconhecido'),
      ),
      (chart) => emit(
        VariacaoAtivoSuccess(chart: chart),
      ),
    );
  }

  void setError({required String errorMessage}) {
    emit(VariacaoAtivoError(errorMessage: errorMessage));
  }
}
