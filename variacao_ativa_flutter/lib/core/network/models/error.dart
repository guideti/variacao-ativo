import 'package:variacao_ativa_flutter/core/network/models/api_result.dart';

class Erro extends ApiResult {
  Erro({
    required super.statusMessage,
    super.statusCode,
  });
}
