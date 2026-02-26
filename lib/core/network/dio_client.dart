import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioClient {
  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        // baseUrl: 'https://app.sanjivanmedicotraders.in/api/v1/',
        baseUrl: 'https://api.coinranking.com/',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          debugPrint("REQUEST[${options.method}] => ${options.uri}");
          handler.next(options);
        },
        onResponse: (response, handler) {
          debugPrint("RESPONSE[${response.statusCode}] => ${response.requestOptions.uri}");
          handler.next(response);
        },
        onError: (error, handler) {
          debugPrint("ERROR[${error.response?.statusCode}] => ${error.requestOptions.uri}");
          handler.next(error);
        },
      ),
    );

    return dio;
  }
}
