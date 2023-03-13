import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:variacao_ativa_flutter/core/network/models/error.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/data/models/chart_model.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/domain/usecases/variacao_ativo_usecase.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/presentation/cubit/variacao_ativo_cubit.dart';

import '../../../mock/chart_mock.dart';

class _MockVariacaoAtivoUsecase extends Mock implements VariacaoAtivoUseCase {}

void main() {
  late VariacaoAtivoUseCase mockVariacaoAtivoUseCase;
  late VariacaoAtivoCubit cubit;

  setUp(
    () {
      mockVariacaoAtivoUseCase = _MockVariacaoAtivoUsecase();

      cubit = VariacaoAtivoCubit(
        mockVariacaoAtivoUseCase,
      );
    },
  );

  group('Test VariacaoAtivo Cubit', () {
    final Map<String, dynamic> jsonMap = json.decode(tChartMock);
    final chartEntity = ChartModel.fromJson(jsonMap);
    test('Should return VariacaoAtivoInitial as initial state', () {
      expect(cubit.state, VariacaoAtivoInitial());
    });

    blocTest<VariacaoAtivoCubit, VariacaoAtivoState>(
      'Should emit VariacaoAtivoSuccess State',
      build: () {
        when(() => mockVariacaoAtivoUseCase.getActiveVariation(
            activeName: 'activeName')).thenAnswer(
          (_) async => Right(
            chartEntity,
          ),
        );

        return cubit;
      },
      act: (cubit) => cubit.getActiveVariation(activeName: 'activeName'),
      expect: () => <dynamic>[
        VariacaoAtivoLoading(),
        VariacaoAtivoSuccess(chart: chartEntity),
      ],
    );

    blocTest<VariacaoAtivoCubit, VariacaoAtivoState>(
      'Should emit VariacaoAtivoError State',
      build: () {
        when(
          () => mockVariacaoAtivoUseCase.getActiveVariation(
            activeName: 'activeName',
          ),
        ).thenAnswer(
          (_) async => Left(
            Erro(statusMessage: ''),
          ),
        );

        return cubit;
      },
      act: (cubit) => cubit.getActiveVariation(activeName: 'activeName'),
      expect: () => <dynamic>[
        VariacaoAtivoLoading(),
        const VariacaoAtivoError(errorMessage: ''),
      ],
    );

    blocTest<VariacaoAtivoCubit, VariacaoAtivoState>(
      'Should emit VariacaoAtivoError State on setError',
      build: () {
        return cubit;
      },
      act: (cubit) => cubit.setError(errorMessage: 'errorMessage'),
      expect: () => <dynamic>[
        const VariacaoAtivoError(errorMessage: 'errorMessage'),
      ],
    );

    blocTest<VariacaoAtivoCubit, VariacaoAtivoState>(
      'Should emit VariacaGetActiveError State',
      build: () {
        return cubit;
      },
      act: (cubit) => cubit.setGetActiveError(),
      expect: () => <dynamic>[
        VariacaoAtivoGetActiveError(),
      ],
    );
  });
}
