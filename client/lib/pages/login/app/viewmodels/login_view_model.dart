import 'package:expensetracker/commons/domain/token_entity.dart';
import 'package:expensetracker/pages/login/app/viewmodels/login_state.dart';
import 'package:expensetracker/pages/login/domain/usecase/login_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginViewModel extends StateNotifier<LoginPageState> {
  final LoginUsecase _loginUsecase;

  LoginViewModel(this._loginUsecase) : super(LoginPageState());
  void updateEmail(String email) {
    state = state.copyWith(emailId: email);
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }

  void errorMessage(String errorMessage) {
    state = state.copyWith(errorMessage: errorMessage);
  }

  bool isPasswordValid() {
    return state.password != null && state.password!.isNotEmpty;
  }

  Future<bool> loginUser(String? emailId, String? password) async {
    if (emailId == null ||
        password == null ||
        emailId.isEmpty ||
        password.isEmpty) {
      state = state.copyWith(isLoading: false, errorMessage: '');
      return false;
    }

    try {
      state = state.copyWith(isLoading: true, errorMessage: '');
      final TokenEntity token = await _loginUsecase.call(emailId, password);

      state = state.copyWith(isLoading: false, token: token, errorMessage: '');

      return true;
    } catch (e) {
      String errorMessage = 'Login failed';

      if (e.toString().contains('{error:')) {
        errorMessage = e.toString().split('{error:')[1].split('}')[0].trim();
      }

      state = state.copyWith(isLoading: false, errorMessage: errorMessage);
      return false;
    }
  }
}
