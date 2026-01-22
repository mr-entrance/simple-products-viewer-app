import 'package:dio/dio.dart';

class ApiConstants {
  static const String baseApiUrl =
      "https://s3-eu-west-1.amazonaws.com/api.themeshplatform.com";
  static const String productListPath = "/products.json";
  static const int connectTimeout = 30; // in sec
  static const int receiveTimeout = 30; // in sec
}

class ApiClient {
  late final Dio dio;
  ApiClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseApiUrl,
        connectTimeout: const Duration(seconds: ApiConstants.connectTimeout),
        receiveTimeout: const Duration(seconds: ApiConstants.receiveTimeout),
      ),
    );
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }

  Future<Response> get({required String path}) async {
    return dio.get(path);
  }
}
