import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants.dart';
import '../../core/exceptions.dart';
import '../models/breed.dart';

class CacheService {
  final SharedPreferences _prefs;

  CacheService(this._prefs);

  static Future<CacheService> create() async {
    final prefs = await SharedPreferences.getInstance();
    return CacheService(prefs);
  }

  Future<void> cacheFirstPageBreeds(BreedsResponse response) async {
    try {
      final jsonString = jsonEncode(response.toJson());
      final timestamp = DateTime.now().millisecondsSinceEpoch;

      await _prefs.setString(CacheConstants.breedsFirstPageKey, jsonString);
      await _prefs.setInt(
        '${CacheConstants.breedsFirstPageKey}_timestamp',
        timestamp,
      );
    } catch (e) {
      throw CacheException(message: 'Failed to cache breeds', originalError: e);
    }
  }

  Future<BreedsResponse?> getCachedFirstPageBreeds() async {
    try {
      final jsonString = _prefs.getString(CacheConstants.breedsFirstPageKey);
      final timestamp = _prefs.getInt(
        '${CacheConstants.breedsFirstPageKey}_timestamp',
      );

      if (jsonString == null || timestamp == null) return null;

      final cacheTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
      if (DateTime.now().difference(cacheTime) > CacheConstants.cacheExpiration) {
        await clearBreedsCache();
        return null;
      }

      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      return BreedsResponse.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  Future<void> clearBreedsCache() async {
    try {
      await _prefs.remove(CacheConstants.breedsFirstPageKey);
      await _prefs.remove('${CacheConstants.breedsFirstPageKey}_timestamp');
    } catch (e) {
      throw CacheException(message: 'Failed to clear cache', originalError: e);
    }
  }

  Future<void> clearAllCache() async {
    try {
      await _prefs.clear();
    } catch (e) {
      throw CacheException(message: 'Failed to clear all cache', originalError: e);
    }
  }
}
