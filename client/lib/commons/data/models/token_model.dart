import 'package:expensetracker/commons/domain/token_entity.dart';

class TokenModel {
  final String id;
  final String name;
  final String email;
  final String token;
  final String refreshToken;
  final String createdAt;
  final String updatedAt;
  final String userId;

  TokenModel({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
    required this.refreshToken,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
  });

  // Convert JSON response to TokenModel
  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      token: json['token'] ?? '',
      refreshToken: json['refresh_token'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      userId: json['user_id'] ?? '',
    );
  }

  // Convert TokenModel to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'token': token,
      'refresh_token': refreshToken,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'user_id': userId,
    };
  }

  // Convert TokenModel to TokenEntity
  TokenEntity toEntity() {
    return TokenEntity(
      id: id,
      name: name,
      email: email,
      token: token,
      refreshToken: refreshToken,
      createdAt: createdAt,
      updatedAt: updatedAt,
      userId: userId,
    );
  }
}
