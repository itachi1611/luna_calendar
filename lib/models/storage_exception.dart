/// Exception thrown when a storage operation fails
class StorageException implements Exception {
  final String message;
  final dynamic error;

  StorageException(this.message, [this.error]);

  @override
  String toString() => 'StorageException: $message${error != null ? '\nError: $error' : ''}';
}