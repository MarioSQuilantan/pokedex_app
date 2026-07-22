import 'package:fpdart/fpdart.dart';

import '../../core.dart';

abstract interface class NetworkService {
  TaskEither<Failure, T> post<T>(
    String path, {
    Object? data,
    Object? pagination,
    Map<String, dynamic>? queryParameters,
  });

  TaskEither<Failure, T> get<T>(String path, {Map<String, dynamic>? queryParameters, Object? pagination});

  TaskEither<Failure, T> put<T>(
    String path, {
    Map<String, dynamic>? data,
    Object? pagination,
    Map<String, dynamic>? queryParameters,
  });

  TaskEither<Failure, T> patch<T>(
    String path, {
    Map<String, dynamic>? data,
    Object? pagination,
    Map<String, dynamic>? queryParameters,
  });

  TaskEither<Failure, T> delete<T>(
    String path, {
    Map<String, dynamic>? data,
    Object? pagination,
    Map<String, dynamic>? queryParameters,
  });
}
