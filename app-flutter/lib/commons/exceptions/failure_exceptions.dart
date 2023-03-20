import 'remote/enums/enums.dart';

class FailureException implements Exception {
  final String message;

  final ExceptionCode? code;

  final List<String>? errors;

  const FailureException({
    required this.message,
    this.code,
    this.errors,
  });

  @override
  String toString() =>
      "ServerException: (message: $message | code: $code | errors: $errors)";
}
