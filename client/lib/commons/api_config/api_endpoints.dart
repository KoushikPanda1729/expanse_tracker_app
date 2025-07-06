import 'package:expensetracker/commons/api_config/api_enpoints_types.dart';

class ApiEndpoints {
  static final List<ApiEndpoint> endpoints = [
    login,
    signUp,
  ];

  static ApiEndpoint login = ApiEndpoint(
    path: '/users/login',
    requiresAuth: false,
  );

  static ApiEndpoint signUp = ApiEndpoint(
    path: '/users/signup',
    requiresAuth: false,
  );
}
