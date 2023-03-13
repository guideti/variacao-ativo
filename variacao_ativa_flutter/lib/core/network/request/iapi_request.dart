import 'package:variacao_ativa_flutter/core/network/models/api_result.dart';
import 'package:variacao_ativa_flutter/core/network/models/network_request.dart';

abstract class IApiRequest {
  Future<ApiResult> nativeRequest({required NetworkRequest networkRequest});
}
