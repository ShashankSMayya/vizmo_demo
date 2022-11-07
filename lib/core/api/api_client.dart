import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiClient {
  final Dio _dio;

  ApiClient(this._dio);

  dynamic get(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParams);
      return response.data;
    } on DioError catch (e) {
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
      rethrow;
    }
  }
}
