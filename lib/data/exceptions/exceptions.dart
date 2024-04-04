// Server
final class ServerException implements Exception {
  const ServerException();
}

// Cache
final class CacheException implements Exception {
  const CacheException();
}

// Auth
final class AuthException implements Exception {
  const AuthException();
}

/// Item not found in cache
final class ItemNotFoundInCache implements CacheException {
  const ItemNotFoundInCache();
}
