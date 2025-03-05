import 'package:dio/dio.dart';
import 'package:expensetracker/commons/api_config/api_endpoints.dart';
import 'package:expensetracker/commons/api_config/dio_client.dart';
import 'package:expensetracker/commons/data/models/token_model.dart';

class LoginDatasource {
  final DioClient _dioClient;

  LoginDatasource(this._dioClient);

  Future<TokenModel> loginWithEmailAndPassword(
      String email, String password) async {
    final String url = ApiEndpoints.login.path;

    try {
      final response = await _dioClient.dio.post(url, data: {
        'email': email,
        'password': password,
      });
      print("===response => ${response.data}");

      // Directly parse the response data as the API returns the full user object
      if (response.statusCode == 200) {
        return TokenModel.fromJson(response.data);
      } else {
        throw Exception('Failed to login. Please check your credentials.');
      }
    } on DioException catch (e) {
      print('DioException: ${e.response?.data ?? e.message}');
      throw Exception('Network error: ${e.response?.data ?? e.message}');
    } catch (e) {
      print('Login error: $e');
      throw Exception('Error: ${e.toString()}');
    }
  }
}
