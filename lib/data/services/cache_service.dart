import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants.dart';
import '../../core/exceptions.dart';
import '../models/breed.dart';

/// Service for caching data locally using SharedPreferences
class CacheService {
  final SharedPreferences _prefs;

  CacheService(this._prefs);

  /// Factory constructor for async initialization
  static Future<CacheService> create() async {
    final prefs = await SharedPreferences.getInstance();
    return CacheService(prefs);
  }

  /// Cache the first page of breeds
  Future<void> cacheFirstPageBreeds(BreedsResponse response) async {
    try {
      final jsonString = jsonEncode(response.toJson());
      final timestamp = DateTime.now().millisecondsSinceEpoch;

      await _prefs.setString(
        CacheConstants.breedsFirstPageKey,
        jsonString,
      );
      await _prefs.setInt(
        '${CacheConstants.breedsFirstPageKey}_timestamp',
        timestamp,
      );
    } catch (e) {
      throw CacheException(
        message: 'Failed to cache breeds',
        originalError: e,
      );
    }
  }

  /// Retrieve cached first page of breeds if valid
  Future<BreedsResponse?> getCachedFirstPageBreeds() async {
    try {
      final jsonString = _prefs.getString(CacheConstants.breedsFirstPageKey);
      final timestamp = _prefs.getInt(
        '${CacheConstants.breedsFirstPageKey}_timestamp',
      );

      if (jsonString == null || timestamp == null) {
        return null;
      }

      // Check if cache is expired
      final cacheTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
      final now = DateTime.now();
      final difference = now.difference(cacheTime);

      if (difference > CacheConstants.cacheExpiration) {
        // Cache expired, clear it
        await clearBreedsCache();
        return null;
      }

      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      return BreedsResponse.fromJson(json);
    } catch (e) {
      // If there's any error reading cache, just return null
      // Don't throw exception to avoid blocking the app
      return null;
    }
  }

  /// Clear breeds cache
  Future<void> clearBreedsCache() async {
    try {
      await _prefs.remove(CacheConstants.breedsFirstPageKey);
      await _prefs.remove('${CacheConstants.breedsFirstPageKey}_timestamp');
    } catch (e) {
      throw CacheException(
        message: 'Failed to clear cache',
        originalError: e,
      );
    }
  }

  /// Clear all app cache
  Future<void> clearAllCache() async {
    try {
      await _prefs.clear();
    } catch (e) {
      throw CacheException(
        message: 'Failed to clear all cache',
        originalError: e,
      );
    }
  }
}
