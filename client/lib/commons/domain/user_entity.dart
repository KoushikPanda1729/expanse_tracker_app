import 'package:expensetracker/commons/domain/token_entity.dart';

class UserEntity {
  final String? userId;
  final String? name;
  final String email;
  final String? password;
  final String? userImage;
  final bool? isFirstTimeLogin;
  final String? region;
  final TokenEntity? token;

  UserEntity({
    this.userId,
    this.name,
    required this.email,
    this.password,
    this.userImage,
    this.isFirstTimeLogin = false,
    this.region,
    this.token,
  });

  UserEntity copyWith({
    String? userId,
    String? name,
    String? email,
    String? password,
    String? userImage,
    bool? isFirstTimeLogin,
    String? region,
    TokenEntity? token,
  }) {
    return UserEntity(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      userImage: userImage ?? this.userImage,
      isFirstTimeLogin: isFirstTimeLogin ?? this.isFirstTimeLogin,
      region: region ?? this.region,
      token: token ?? this.token,
    );
  }

  @override
  String toString() {
    return 'UserEntity(userId: $userId, name: $name, email: $email, password: $password, userImage: $userImage, isFirstTimeLogin: $isFirstTimeLogin, region: $region, token: $token)';
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'password': password,
      'userImage': userImage,
      'isFirstTimeLogin': isFirstTimeLogin,
      'region': region,
      'token': token?.toJson(),
    };
  }

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      userId: json['userId'],
      name: json['name'],
      email: json['email'] ?? '',
      password: json['password'],
      userImage: json['userImage'],
      isFirstTimeLogin: json['isFirstTimeLogin'],
      region: json['region'],
      token: json['token'] != null ? TokenEntity.fromJson(json['token']) : null,
    );
  }
}
