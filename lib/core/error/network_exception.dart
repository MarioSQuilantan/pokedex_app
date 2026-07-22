import 'package:dio/dio.dart';

import 'failure.dart';

class NetworkException {
  static Failure handle(DioException e) {
    final serverMessage = _extractServerMessage(e);

    switch (e.type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        return Failure(message: serverMessage ?? 'No internet connection');

      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.connectionTimeout:
        return Failure(message: serverMessage ?? 'Timeout response');

      case DioExceptionType.badResponse:
        return Failure(message: serverMessage ?? 'Bad response');

      default:
        return Failure(message: serverMessage ?? 'Unknown error');
    }
  }

  static String? _extractServerMessage(DioException e) {
    try {
      if (e.response?.data is Map) {
        if (e.response?.data.containsKey('msgResponse')) {
          return (e.response?.data as Map)['msgResponse']?.toString();
        }
        return (e.response?.data as Map)['message']?.toString();
      }
    } catch (_) {}
    return e.message;
  }
}
