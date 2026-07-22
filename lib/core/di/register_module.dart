import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../env/env.dart';
import '../router/router.dart';

const _baseUrl = 'BaseUrl';

@module
abstract class RegisterModule {
  @Named(_baseUrl)
  String get baseUrl => Env.baseUrl;

  @lazySingleton
  Dio dio(@Named(_baseUrl) String url) {
    return Dio(
      BaseOptions(
        baseUrl: url,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: const {'Content-Type': 'application/json', 'Accept': 'application/json'},
      ),
    );
  }

  @lazySingleton
  AppRouter appRouter() => AppRouter();
}
