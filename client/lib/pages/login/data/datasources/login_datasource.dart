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

      if (response.data["IsSuccess"] == true &&
          response.data['Response'] != null &&
          response.data['Response'] is Map<String, dynamic>) {
        return TokenModel.fromJson(response.data['Response']);
      } else {
        throw Exception('Failed to login. Please check your credentials.');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Error: ${e.toString()}');
    }
  }
}
