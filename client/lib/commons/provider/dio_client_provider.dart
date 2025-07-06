// Provider for DioClient - singleton for the entire app
import 'package:expensetracker/commons/api_config/dio_client.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioClientProvider = Provider<DioClient>((ref) {
  String? baseUrl;
  try {
    baseUrl = dotenv.env['BASE_URL'];
  } catch (e) {
    print("------------------>$baseUrl");
    print('Error accessing environment variables: $e');
    // Continue with the default
  }
  print("------------outside------>$baseUrl");
  return DioClient(baseUrl: baseUrl);
});
