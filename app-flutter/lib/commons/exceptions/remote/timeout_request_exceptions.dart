import './server_exceptions.dart';
import 'enums/enums.dart';

class TimeoutRequestException implements ServerException {
  /// A message describing the format error.
  @override
  final String message;

  /// Creates a new BadRequestException with an optional error [message].
  const TimeoutRequestException([this.message = ""]);

  @override
  ExceptionCode get code => ExceptionCode.TIMEOUT_REQUEST;

  @override
  String toString() => "ServerException: (message: $message | code: $code)";
}
