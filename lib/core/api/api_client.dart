import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiClient {
  final Dio _dio;

  ApiClient(this._dio);

  dynamic get(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      print('GET: $path');
      final response = await _dio.get(path, queryParameters: queryParams);
      print(response.data);
      return response.data;
    } on DioError catch (e) {
      print(e);
      rethrow;
    }
  }

  dynamic post(
    String url, {
    Map<String, dynamic>? data,
  }) async {
    try {
      print('POST: $url');
      final response = await _dio.post(url, data: data);
      print(response.data);
      return response.data;
    } on DioError catch (e) {
      print(e);
      rethrow;
    }
  }
}
