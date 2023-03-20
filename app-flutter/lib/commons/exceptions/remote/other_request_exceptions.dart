import './server_exceptions.dart';
import 'enums/enums.dart';

class OtherRequestException implements ServerException {
  /// A message describing the format error.
  @override
  final String message;

  /// A code describing the format error.
  final int status;

  /// Creates a new BadRequestException with an optional error [message].
  const OtherRequestException(this.status, [this.message = ""]);

  @override
  ExceptionCode get code => ExceptionCode.OTHER_REQUEST;

  @override
  String toString() =>
      "ServerException: (message: $message | code: $code | status: $status)";
}
