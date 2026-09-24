abstract class AppException implements Exception {
  final String message;
  final dynamic cause;

  const AppException(this.message, [this.cause]);

  @override
  String toString() => '$runtimeType: $message${cause != null ? ' (Cause: $cause)' : ''}';
}

class DatabaseException extends AppException {
  const DatabaseException(super.message, [super.cause]);
}

class SyncException extends AppException {
  const SyncException(super.message, [super.cause]);
}

class ValidationException extends AppException {
  const ValidationException(super.message, [super.cause]);
}

class NetworkException extends AppException {
  const NetworkException(super.message, [super.cause]);
}
