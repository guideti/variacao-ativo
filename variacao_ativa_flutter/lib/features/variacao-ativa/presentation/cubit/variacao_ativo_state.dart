part of 'variacao_ativo_cubit.dart';

abstract class VariacaoAtivoState extends Equatable {
  const VariacaoAtivoState();

  @override
  List<Object> get props => [];
}

class VariacaoAtivoInitial extends VariacaoAtivoState {}

class VariacaoAtivoLoading extends VariacaoAtivoState {}

class VariacaoAtivoError extends VariacaoAtivoState {
  final String errorMessage;

  const VariacaoAtivoError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class VariacaoAtivoSuccess extends VariacaoAtivoState {
  final ChartEntity chart;

  const VariacaoAtivoSuccess({required this.chart});

  @override
  List<Object> get props => [chart];
}
