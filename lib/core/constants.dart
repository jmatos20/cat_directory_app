/// API Constants
class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://catfact.ninja';
  static const String breedsEndpoint = '/breeds';
  static const String factEndpoint = '/fact';

  // Pagination
  static const int defaultPageSize = 10;
  static const int firstPage = 1;

  // Timeouts
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration factRequestTimeout = Duration(seconds: 10);
}

/// Cache Constants
class CacheConstants {
  CacheConstants._();

  static const String breedsFirstPageKey = 'breeds_first_page';
  static const Duration cacheExpiration = Duration(hours: 24);
}

/// UI Constants
class UIConstants {
  UIConstants._();

  static const double defaultPadding = 16.0;
  static const double cardBorderRadius = 12.0;
  static const int shimmerItemCount = 10;
  static const double scrollThreshold = 0.8; // 80% scroll triggers load more
}
