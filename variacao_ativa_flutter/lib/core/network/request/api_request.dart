import 'package:flutter/services.dart';
import 'package:variacao_ativa_flutter/core/common/native_helper.dart';
import 'package:variacao_ativa_flutter/core/network/models/api_result.dart';
import 'package:variacao_ativa_flutter/core/network/models/error.dart';
import 'package:variacao_ativa_flutter/core/network/models/native_api_response.dart';
import 'package:variacao_ativa_flutter/core/network/models/network_request.dart';
import 'package:variacao_ativa_flutter/core/network/models/success.dart';
import 'package:variacao_ativa_flutter/core/network/request/iapi_request.dart';

class ApiRequest implements IApiRequest {
  @override
  Future<ApiResult> nativeRequest({
    required NetworkRequest networkRequest,
  }) async {
    try {
      final result = await platform.invokeMapMethod<String, dynamic>(
        'getDataFromApi',
        networkRequest.toJson(),
      );
      try {
        final nativeApiResponse = NativeApiResponse.fromJson(result!);
        if (nativeApiResponse.statusCode == 200) {
          return Success(
            data: nativeApiResponse.data,
            statusCode: nativeApiResponse.statusCode,
          );
        } else {
          return Erro(statusMessage: nativeApiResponse.errorMessage);
        }
      } catch (e) {
        return Erro(statusMessage: 'Falha ao decodificar response');
      }
    } on PlatformException catch (e) {
      return Erro(
        statusMessage: e.message,
        statusCode: 999,
      );
    }
  }
}
