import './server_exceptions.dart';
import 'enums/enums.dart';

class NotFoundRequestException implements ServerException {
  /// A message describing the format error.
  @override
  final String message;

  /// Creates a new BadRequestException with an optional error [message].
  const NotFoundRequestException([this.message = ""]);

  @override
  ExceptionCode get code => ExceptionCode.NOT_FOUND_REQUEST;

  @override
  String toString() => "ServerException: (message: $message | code: $code)";
}
