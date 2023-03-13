import 'package:get_it/get_it.dart';
import 'package:variacao_ativa_flutter/core/network/request/api_request.dart';
import 'package:variacao_ativa_flutter/core/network/request/iapi_request.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/data/datasources/variacao_ativo_datasource.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/data/repositories/variacao_ativo_repository.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/domain/repositories/ivariacao_ativo_repository.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/domain/usecases/variacao_ativo_usecase.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/presentation/cubit/variacao_ativo_cubit.dart';

final getIt = GetIt.instance;

void setup() {
  _configure();
  _variacaoAtivo();
}

void _configure() {
  getIt.registerSingleton<IApiRequest>(ApiRequest());
}

void _variacaoAtivo() {
  getIt.registerFactory(() => VariacaoAtivoDataSource(getIt()));
  getIt.registerFactory<IVariacaoAtivoRepository>(
      () => VariacaoAtivoRepository(getIt()));
  getIt.registerFactory(() => VariacaoAtivoUseCase(getIt()));
  getIt.registerFactory(
    () => VariacaoAtivoCubit(
      getIt(),
    ),
  );
}
