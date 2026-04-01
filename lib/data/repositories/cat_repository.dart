import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import '../../core/constants.dart';
import '../../core/result.dart';
import '../models/breed.dart';
import '../models/fact.dart';

/// Repository interface for cat-related data operations
abstract class CatRepository {
  Future<Result<BreedsResponse>> getBreeds({required int page, int? limit});
  Future<Result<Fact>> getRandomFact();
}

/// Implementation of CatRepository using Dio for HTTP requests
class CatRepositoryImpl implements CatRepository {
  final Dio _dio;

  CatRepositoryImpl({Dio? dio}) : _dio = dio ?? _createDio();

  static Dio _createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: ApiConstants.connectionTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    // Add interceptors for logging in debug mode
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        error: true,
        logPrint: (obj) => debugPrint('[DIO] $obj'),
      ),
    );

    return dio;
  }

  @override
  Future<Result<BreedsResponse>> getBreeds({
    required int page,
    int? limit,
  }) async {
    try {
      final response = await _dio.get(
        ApiConstants.breedsEndpoint,
        queryParameters: {
          'page': page,
          'limit': limit ?? ApiConstants.defaultPageSize,
        },
      );

      if (response.statusCode == 200) {
        final breedsResponse = BreedsResponse.fromJson(
          response.data as Map<String, dynamic>,
        );
        return right(breedsResponse);
      } else {
        return left(
          ServerFailure(
            message: 'Error del servidor: ${response.statusCode}',
            code: '${response.statusCode}',
          ),
        );
      }
    } on DioException catch (e) {
      return left(_handleDioException(e));
    } catch (e) {
      return left(
        UnknownFailure(
          message: 'Ocurrió un error inesperado',
          originalError: e,
        ),
      );
    }
  }

  @override
  Future<Result<Fact>> getRandomFact() async {
    try {
      final response = await _dio.get(ApiConstants.factEndpoint);

      if (response.statusCode == 200) {
        final fact = Fact.fromJson(response.data as Map<String, dynamic>);
        return right(fact);
      } else {
        return left(
          ServerFailure(
            message: 'Error del servidor: ${response.statusCode}',
            code: '${response.statusCode}',
          ),
        );
      }
    } on DioException catch (e) {
      return left(_handleDioException(e));
    } catch (e) {
      return left(
        UnknownFailure(
          message: 'Ocurrió un error inesperado',
          originalError: e,
        ),
      );
    }
  }

  /// Centralized error handling for Dio exceptions
  Failure _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkFailure(
          message: 'Tiempo de conexión agotado. Verifica tu conexión a internet.',
          code: 'TIMEOUT',
          originalError: e,
        );

      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        return ServerFailure(
          message: _getServerErrorMessage(statusCode),
          code: '$statusCode',
          originalError: e,
        );

      case DioExceptionType.cancel:
        return NetworkFailure(
          message: 'La solicitud fue cancelada',
          code: 'CANCELLED',
          originalError: e,
        );

      case DioExceptionType.connectionError:
        return NetworkFailure(
          message: 'Sin conexión a internet. Verifica tu red.',
          code: 'NO_CONNECTION',
          originalError: e,
        );

      default:
        return UnknownFailure(
          message: 'Ocurrió un error inesperado: ${e.message}',
          originalError: e,
        );
    }
  }

  String _getServerErrorMessage(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Solicitud incorrecta. Intenta de nuevo.';
      case 401:
        return 'Acceso no autorizado.';
      case 403:
        return 'Acceso denegado.';
      case 404:
        return 'Recurso no encontrado.';
      case 500:
        return 'Error del servidor. Intenta más tarde.';
      case 503:
        return 'Servicio no disponible. Intenta más tarde.';
      default:
        return 'Error del servidor (${statusCode ?? 'desconocido'})';
    }
  }
}
