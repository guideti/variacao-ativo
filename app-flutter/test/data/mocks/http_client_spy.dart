import 'package:ativo/commons/exceptions/exceptions.dart';
import 'package:ativo/layers/data/data.dart';

import 'package:mocktail/mocktail.dart';

class HttpClientSpy extends Mock implements HttpClient {
  When mockRequestCall() => when(
        () => request(
          url: any(named: 'url'),
          method: any(named: 'method'),
          body: any(named: 'body'),
          headers: any(named: 'headers'),
        ),
      );
  void mockRequest(dynamic data) => mockRequestCall().thenAnswer((_) async => data);
  void mockRequestError(ServerException error) => mockRequestCall().thenThrow(error);
}
