import './server_exceptions.dart';
import 'enums/enums.dart';

class ForbiddenRequestException implements ServerException {
  /// A message describing the format error.
  @override
  final String message;

  final List<String>? errors;

  /// Creates a new BadRequestException with an optional error [message].
  const ForbiddenRequestException([this.message = "", this.errors]);

  @override
  ExceptionCode get code => ExceptionCode.FORBIDDEN_REQUEST;

  @override
  String toString() => "ServerException: (message: $message | code: $code)";
}
