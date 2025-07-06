import 'package:expensetracker/commons/domain/user_entity.dart';

class UserModel {
  final String? name;
  final String email;
  final String? region;

  UserModel({this.name, required this.email, this.region});

  // Convert JSON to UserModel
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'] ?? '',
      region: json['region'],
    );
  }

  // Convert UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'region': region,
    };
  }

  // Convert UserModel to UserEntity
  UserEntity toEntity() {
    return UserEntity(
      name: name,
      email: email,
      region: region,
    );
  }

  // Convert UserEntity to UserModel
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      name: entity.name,
      email: entity.email,
      region: entity.region,
    );
  }

  // Create a copy of UserModel with modified values
  UserModel copyWith({String? name, String? email, String? region}) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      region: region ?? this.region,
    );
  }

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, region: $region)';
  }
}
