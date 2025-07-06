import 'package:dio/dio.dart';

class ApiError implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  ApiError({
    required this.message,
    this.statusCode,
    this.data,
  });

  @override
  String toString() => message;

  factory ApiError.fromDioError(DioException error) {
    String message = 'An error occurred';
    int? statusCode = error.response?.statusCode;
    dynamic data = error.response?.data;

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout. Please check your internet connection.';
        break;
      case DioExceptionType.sendTimeout:
        message = 'Send timeout. Please check your internet connection.';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout. Please check your internet connection.';
        break;
      case DioExceptionType.badResponse:
        // Try to extract error message from response
        if (data is Map<String, dynamic>) {
          message = data['message'] ??
              data['error'] ??
              data['errors']?.toString() ??
              'Server error ${statusCode ?? ''}';
        } else {
          message = 'Server error ${statusCode ?? ''}';
        }
        break;
      case DioExceptionType.cancel:
        message = 'Request was cancelled';
        break;
      case DioExceptionType.connectionError:
        message = 'Connection error. Please check your internet connection.';
        break;
      case DioExceptionType.unknown:
        if (error.message?.contains('SocketException') ?? false) {
          message = 'No internet connection. Please check your network.';
        } else {
          message = error.message ?? 'Unknown error occurred';
        }
        break;
      default:
        message = 'Something went wrong: ${error.message}';
    }

    return ApiError(
      message: message,
      statusCode: statusCode,
      data: data,
    );
  }
}
