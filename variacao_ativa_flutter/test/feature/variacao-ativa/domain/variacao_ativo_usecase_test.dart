import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:variacao_ativa_flutter/core/network/models/error.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/data/models/chart_model.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/domain/entities/chart_entity.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/domain/repositories/ivariacao_ativo_repository.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/domain/usecases/variacao_ativo_usecase.dart';

import '../../../mock/chart_mock.dart';

class MockVariacaoAtivoRepository extends Mock
    implements IVariacaoAtivoRepository {}

void main() {
  late VariacaoAtivoUseCase usecase;
  late IVariacaoAtivoRepository repository;

  setUp(() {
    repository = MockVariacaoAtivoRepository();
    usecase = VariacaoAtivoUseCase(repository);
  });

  test('should get chartEntity for a given date from the repository',
      () async {
    final Map<String, dynamic> jsonMap = json.decode(tChartMock);
    final chartEntity = ChartModel.fromJson(jsonMap);

    when(
      () => repository.getActiveVariation(activeName: 'activeName'),
    ).thenAnswer(
      (_) async => Right(
        chartEntity,
      ),
    );

    final result = await usecase.getActiveVariation(activeName: 'activeName');

    expect(result, Right<Erro, ChartEntity>(chartEntity));
    verify(() => repository.getActiveVariation(activeName: 'activeName'))
        .called(1);
  });

  test('should return a error when don\'t succeed', () async {
    when(() => repository.getActiveVariation(activeName: 'activeName'))
        .thenAnswer(
      (_) async => Left<Erro, ChartEntity>(
        Erro(statusMessage: ''),
      ),
    );
    final result = await usecase.getActiveVariation(activeName: 'activeName');
    expect(result, isA<Left<Erro, ChartEntity>>());
    verify(() => repository.getActiveVariation(activeName: 'activeName'))
        .called(1);
  });
}
