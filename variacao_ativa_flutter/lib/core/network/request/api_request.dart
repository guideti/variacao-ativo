import 'package:flutter/material.dart';
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
      final result = await platform.invokeMethod('getDataFromApi');
      try {
        final nativeApiResponse = NativeApiResponse.fromJson(result);
        debugPrint(nativeApiResponse.toString());
        if (nativeApiResponse.httpUrlResponse?['statusCode'] < 200) {
          return Success(data: nativeApiResponse.data);
        } else {
          return Erro(
              statusMessage: nativeApiResponse.errorMessage?['message']);
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
