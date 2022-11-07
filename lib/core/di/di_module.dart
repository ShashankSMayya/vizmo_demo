import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vizmo_demo/core/api/api_constants.dart';

@module
abstract class InjectionModule {
  /// Register all the dependencies here that can't be initialized in the constructor

  @Named('baseUrl')
  String get baseUrl => ApiConstants.baseUrl;

  @lazySingleton
  Dio dio(@Named('baseUrl') String baseUrl) => Dio(
        BaseOptions(
          baseUrl: baseUrl,
          contentType: Headers.jsonContentType,
          connectTimeout: 60 * 1000,
          receiveTimeout: 60 * 1000,
          sendTimeout: 30 * 1000,
        ),
      );
}
