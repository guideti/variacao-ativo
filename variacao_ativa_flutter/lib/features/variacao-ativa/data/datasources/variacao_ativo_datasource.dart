import 'package:variacao_ativa_flutter/core/network/models/api_result.dart';
import 'package:variacao_ativa_flutter/core/network/models/network_request.dart';
import 'package:variacao_ativa_flutter/core/network/request/iapi_request.dart';

class VariacaoAtivoDataSource {
  final IApiRequest _iApiRequest;

  VariacaoAtivoDataSource(this._iApiRequest);
  Future<ApiResult> getActiveVariation({required String activeName}) async {
    final result = await _iApiRequest.nativeRequest(
      networkRequest: NetworkRequest(
        path: 'https://query2.finance.yahoo.com/v8/finance/chart/$activeName',
        httpMethod: HttpMethod.get,
      ),
    );

    return result;
  }
}
