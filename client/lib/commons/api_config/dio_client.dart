import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient({String? baseUrl})
      : dio = Dio(BaseOptions(
          baseUrl: baseUrl ??
              'http://localhost:8000/v1/api', // Ensure 'http://' is included
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        )) {
    print("Base URL iiiiiii: ${dio.options.baseUrl}"); // ✅ Print base URL
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }
}
