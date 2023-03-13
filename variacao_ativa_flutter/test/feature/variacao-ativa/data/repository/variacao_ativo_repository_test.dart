import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:variacao_ativa_flutter/core/network/models/error.dart';
import 'package:variacao_ativa_flutter/core/network/models/success.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/data/datasources/variacao_ativo_datasource.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/data/models/chart_model.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/data/repositories/variacao_ativo_repository.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/domain/entities/chart_entity.dart';

import '../../../../mock/chart_mock.dart';

class MockVariacaoAtivoDataSource extends Mock
    implements VariacaoAtivoDataSource {}

void main() {
  late VariacaoAtivoRepository repository;
  late VariacaoAtivoDataSource datasource;
  setUp(() {
    datasource = MockVariacaoAtivoDataSource();
    repository = VariacaoAtivoRepository(datasource);
  });
  test('Return a chartEntity', () async {
    when(
      () => datasource.getActiveVariation(
        activeName: 'activeName',
      ),
    ).thenAnswer(
      (_) async => (Future<Success>.value(
        Future<Success>.value(
          Success(
            data: jsonDecode(tChartMock),
            statusCode: 200,
          ),
        ),
      )),
    );

    final Map<String, dynamic> jsonMap = json.decode(tChartMock);
    final chartModel = ChartModel.fromJson(jsonMap);
    final result =
        await repository.getActiveVariation(activeName: 'activeName');
    expect(result, Right(chartModel));
    verify(() => datasource.getActiveVariation(activeName: 'activeName'))
        .called(1);
  });

  test('Throw exception', () async {
    when(() => datasource.getActiveVariation(activeName: 'activeName'))
        .thenAnswer(
      (_) => Future<Erro>.value(
        Erro(
          statusMessage: '',
          statusCode: 400,
        ),
      ),
    );
    final result =
        await repository.getActiveVariation(activeName: 'activeName');
    expect(result, isA<Left<Erro, ChartEntity>>());
    verify(() => datasource.getActiveVariation(activeName: 'activeName'))
        .called(1);
  });
}
