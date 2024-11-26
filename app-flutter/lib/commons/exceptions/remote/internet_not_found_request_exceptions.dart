import './server_exceptions.dart';
import 'enums/enums.dart';

class InternetNotFoundRequestException implements ServerException {
  /// A message describing the format error.
  @override
  final String message = 'internet disconectada';

  /// Creates a new BadRequestException with an optional error [message].
  InternetNotFoundRequestException();

  @override
  ExceptionCode get code => ExceptionCode.NOT_FOUND_REQUEST;

  @override
  String toString() => "ServerException: (message: $message | code: $code)";
}
