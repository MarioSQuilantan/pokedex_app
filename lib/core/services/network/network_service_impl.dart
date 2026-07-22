import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../error/error.dart';

import 'network_service.dart';

@LazySingleton(as: NetworkService)
class DioNetworkServiceImpl implements NetworkService {
  final Dio dio;

  DioNetworkServiceImpl(this.dio);

  @override
  TaskEither<Failure, T> get<T>(String path, {Map<String, dynamic>? queryParameters, Object? pagination}) {
    return TaskEither.tryCatch(() async {
      final response = await dio.get(path, queryParameters: queryParameters);

      return _extractData<T>(response.data);
    }, (e, _) => _handleDioError(e));
  }

  @override
  TaskEither<Failure, T> post<T>(
    String path, {
    Object? data,
    Object? pagination,
    Map<String, dynamic>? queryParameters,
  }) {
    return TaskEither.tryCatch(() async {
      final response = await dio.post(path, data: data, queryParameters: queryParameters);

      return _extractData<T>(response.data);
    }, (e, _) => _handleDioError(e));
  }

  @override
  TaskEither<Failure, T> put<T>(
    String path, {
    Map<String, dynamic>? data,
    Object? pagination,
    Map<String, dynamic>? queryParameters,
  }) {
    return TaskEither.tryCatch(() async {
      final response = await dio.put(path, data: data, queryParameters: queryParameters);
      return _extractData<T>(response.data);
    }, (e, _) => _handleDioError(e));
  }

  @override
  TaskEither<Failure, T> patch<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Object? pagination,
    bool useToken = true,
    ResponseType? responseType,
  }) {
    return TaskEither.tryCatch(() async {
      final response = await dio.patch(path, data: data, queryParameters: queryParameters);

      if (responseType == ResponseType.bytes) {
        return response.data;
      }

      return _extractData<T>(response.data);
    }, (e, _) => _handleDioError(e));
  }

  @override
  TaskEither<Failure, T> delete<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Object? pagination,
  }) {
    return TaskEither.tryCatch(() async {
      final response = await dio.delete(path, data: data, queryParameters: queryParameters);
      return _extractData<T>(response.data);
    }, (e, _) => _handleDioError(e));
  }

  Failure _handleDioError(Object e) {
    if (e is DioException) {
      return NetworkException.handle(e);
    }

    if (e is Failure) {
      return e;
    }
    return Failure(message: 'Unexpected error');
  }

  T _extractData<T>(dynamic raw) {
    try {
      return raw as T;
    } on NetworkException {
      rethrow;
    } catch (e) {
      throw Failure(message: 'Invalid response format: ${e.toString()}\nRaw data: $raw');
    }
  }
}
