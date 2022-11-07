import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiClient {
  final Dio _dio;

  /// added interceptor to log the request and response
  /// can also add custom interceptor if needed.
  ApiClient(this._dio) {
    _dio.interceptors.add(LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        responseBody: false,
        responseHeader: false));
  }

  dynamic get(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParams);

      return response.data;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw TimeoutException(e.message);
      }
      if (e.type == DioErrorType.other) {
        if (e.message.contains('SocketException')) {
          throw SocketException(e.message);
        }
      }
      if (e.type == DioErrorType.response) {
        if (e.response?.statusCode == 502) {
          throw SocketException(e.message);
        }
      }
      rethrow;
    }
  }

  dynamic post(
    String url, {
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await _dio.post(url, data: data);

      return response.data;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw TimeoutException(e.message);
      }
      if (e.type == DioErrorType.other) {
        if (e.message.contains('SocketException')) {
          throw SocketException(e.message);
        }
      }
      if (e.type == DioErrorType.response) {
        if (e.response?.statusCode == 502) {
          throw SocketException(e.message);
        }
      }
      rethrow;
    }
  }
}
