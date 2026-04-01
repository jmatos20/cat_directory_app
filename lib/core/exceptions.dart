/// Base exception for network-related errors
class NetworkException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic originalError;

  NetworkException({
    required this.message,
    this.statusCode,
    this.originalError,
  });

  @override
  String toString() => 'NetworkException: $message (statusCode: $statusCode)';
}

/// Exception for server errors
class ServerException implements Exception {
  final String message;
  final int statusCode;
  final dynamic originalError;

  ServerException({
    required this.message,
    required this.statusCode,
    this.originalError,
  });

  @override
  String toString() => 'ServerException: $message (statusCode: $statusCode)';
}

/// Exception for cache errors
class CacheException implements Exception {
  final String message;
  final dynamic originalError;

  CacheException({
    required this.message,
    this.originalError,
  });

  @override
  String toString() => 'CacheException: $message';
}
