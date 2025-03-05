import 'package:expensetracker/commons/domain/token_entity.dart';

class LoginPageState {
  final String? emailId;
  final String? password;
  final TokenEntity? token;
  final String? dataRegion;
  final String errorMessage;
  final bool isLoading;

  LoginPageState({
    this.emailId,
    this.password,
    this.token,
    this.dataRegion,
    this.errorMessage = '',
    this.isLoading = false,
  });

  LoginPageState copyWith({
    String? emailId,
    String? password,
    TokenEntity? token,
    String? dataRegion,
    String? errorMessage,
    bool? isLoading,
  }) {
    return LoginPageState(
      emailId: emailId ?? this.emailId,
      password: password ?? this.password,
      token: token ?? this.token,
      dataRegion: dataRegion ?? this.dataRegion,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  String toString() {
    return 'LoginPageState(emailId: $emailId, password: $password, token: $token, dataRegion: $dataRegion, errorMessage:$errorMessage,isLoading: $isLoading)';
  }

  Map<String, dynamic> toJson() {
    return {
      'emailId': emailId,
      'password': password,
      'token': token?.toJson(),
      'dataRegion': dataRegion,
      'errorMessage': errorMessage,
      'isLoading': isLoading,
    };
  }

  factory LoginPageState.fromJson(Map<String, dynamic> json) {
    return LoginPageState(
      emailId: json['emailId'],
      password: json['password'],
      token: json['token'] != null ? TokenEntity.fromJson(json['token']) : null,
      errorMessage: json['errorMessage'] ?? '',
      dataRegion: json['dataRegion'],
      isLoading: json['isLoading'],
    );
  }
}
