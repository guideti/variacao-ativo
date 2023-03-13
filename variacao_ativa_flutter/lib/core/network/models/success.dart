
import 'package:variacao_ativa_flutter/core/network/models/api_result.dart';

class Success extends ApiResult {
  Success({
    required this.data,
    super.statusCode,
    super.statusMessage,
  });
  final dynamic data;
}
