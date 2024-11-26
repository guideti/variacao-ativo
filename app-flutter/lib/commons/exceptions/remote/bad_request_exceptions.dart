import './server_exceptions.dart';
import 'enums/enums.dart';

class BadRequestException implements ServerException {
  /// A message describing the format error.
  @override
  final String message;

  final List<String>? errors;

  /// Creates a new BadRequestException with an optional error [message].
  const BadRequestException([this.message = "", this.errors]);

  factory BadRequestException.fromJson(Map json) {
    List<String> errors = [];
    if (json['errors'] != null) {
      for (var element in (json['errors'] as List)) {
        errors.add(element['message']);
      }
    }

    if (json["description"] != null) {
      errors.add(json['description']);
    }

    return BadRequestException(json['message'], errors);
  }

  @override
  ExceptionCode get code => ExceptionCode.BAD_REQUEST;

  @override
  String toString() => "ServerException: (message: $message | code: $code)";
}
