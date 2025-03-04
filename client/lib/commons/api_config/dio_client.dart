import 'package:dio/dio.dart';
import 'package:expensetracker/commons/api_config/api_config.dart';

class DioClient {
  final Dio dio = Dio(BaseOptions(
    baseUrl: ApiConfig.baseUrl, // Base URL is automatically set
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  DioClient() {
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }
}
