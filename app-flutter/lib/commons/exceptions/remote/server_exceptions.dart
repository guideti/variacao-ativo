import './enums/enums.dart';

abstract class ServerException implements Exception {
  /// A message describing the format error.
  final String message;

  /// A code describing the format error.
  final ExceptionCode code;

  /// Creates a new ServerException with an optional error [message].
  const ServerException(this.code, [this.message = ""]);

  @override
  String toString() => "ServerException: (message: $message)";
}
