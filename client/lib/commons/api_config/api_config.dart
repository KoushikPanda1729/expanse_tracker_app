import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConfig {
  static String get baseUrl =>
      dotenv.env['BASE_URL'] ?? "http://localhost:8000/api";
}
