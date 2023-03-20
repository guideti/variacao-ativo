import 'package:ativo/layers/data/data.dart';
import 'package:ativo/layers/domain/domain.dart';

import '../../../domain/mocks/mocks.dart';
import '../../../infra/mocks/mocks.dart';
import '../../mocks/mocks.dart';

import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

void main() {
  late RemoteLoadChart sut;
  late HttpClientSpy httpClient;
  late String url;
  late Map chartResult;
  late LoadChartParams params;
  late String symbol;

  setUpAll(() {
    chartResult = ApiFactory.makeChartResultJson();
    symbol = faker.randomGenerator.string(1);
    url = faker.internet.httpUrl();
    httpClient = HttpClientSpy();
    httpClient.mockRequest(chartResult);
    sut = RemoteLoadChart(url: url, httpClient: httpClient);
    params = ParamsFactory.makeChartParams();
  });

  test('Should call HttpClient with correct values', () async {
    await sut.fetch(symbol, params: params);

    verifyNever(() => httpClient.request(url: url, method: 'get'));
  });
}
