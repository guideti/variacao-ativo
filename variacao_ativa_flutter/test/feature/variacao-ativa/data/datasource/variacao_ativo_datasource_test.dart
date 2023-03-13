import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:variacao_ativa_flutter/core/network/models/error.dart';
import 'package:variacao_ativa_flutter/core/network/models/network_request.dart';
import 'package:variacao_ativa_flutter/core/network/models/success.dart';
import 'package:variacao_ativa_flutter/core/network/request/iapi_request.dart';
import 'package:variacao_ativa_flutter/features/variacao-ativa/data/datasources/variacao_ativo_datasource.dart';

import '../../../../mock/chart_mock.dart';

class MockIApiRequestManager extends Mock implements IApiRequest {}

class MyNetworkRequestFake extends Fake implements NetworkRequest {}

void main() {
  late VariacaoAtivoDataSource datasource;
  late IApiRequest iApiRequest;

  setUp(() {
    registerFallbackValue(MyNetworkRequestFake());
    iApiRequest = MockIApiRequestManager();
    datasource = VariacaoAtivoDataSource(
      iApiRequest,
    );
  });

  void successMock() {
    when(() => iApiRequest.nativeRequest(
        networkRequest: any(named: 'networkRequest'))).thenAnswer(
      (_) async => Future<Success>.value(
        Success(
          data: tChartMock,
          statusCode: 200,
        ),
      ),
    );
  }

  void errorMock() {
    when(() => iApiRequest.nativeRequest(
        networkRequest: any(named: 'networkRequest'))).thenAnswer(
      (_) async => Future<Erro>.value(
        Erro(
          statusCode: 400,
          statusMessage: 'error',
        ),
      ),
    );
  }

  test('should return a Sucess when the call is successful', () async {
    successMock();
    final result = await datasource.getActiveVariation(activeName: 'alo');
    expect(result, isA<Success>());
  });
  test('should throw a FutureApiResult when the call is unccessful', () async {
    errorMock();
    final result = await datasource.getActiveVariation(activeName: 'alo');
    expect(result, isA<Erro>());
  });
}
