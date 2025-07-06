class TokenEntity {
  final String id;
  final String name;
  final String email;
  final String token;
  final String refreshToken;
  final String createdAt;
  final String updatedAt;
  final String userId;

  TokenEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
    required this.refreshToken,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
  });

  // Convert JSON to `TokenEntity`
  factory TokenEntity.fromJson(Map<String, dynamic> json) {
    return TokenEntity(
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

  // Convert `TokenEntity` to JSON
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

  @override
  String toString() {
    return 'TokenEntity(id: $id, name: $name, email: $email, token: $token, refreshToken: $refreshToken, createdAt: $createdAt, updatedAt: $updatedAt, userId: $userId)';
  }
}
