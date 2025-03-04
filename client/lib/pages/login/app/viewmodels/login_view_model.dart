import 'package:expensetracker/commons/domain/token_entity.dart';
import 'package:expensetracker/pages/login/app/viewmodels/login_state.dart';
import 'package:expensetracker/pages/login/domain/usecase/login_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginViewModel extends StateNotifier<LoginPageState> {
  final LoginUsecase _loginUsecase;

  LoginViewModel(this._loginUsecase) : super(LoginPageState());

  Future<bool> loginUser(String? emailId, String? password) async {
    if (emailId == null ||
        password == null ||
        emailId.isEmpty ||
        password.isEmpty) {
      state = state.copyWith(isLoading: false);
      return false;
    }

    try {
      state = state.copyWith(
        isLoading: true,
      );

      final TokenEntity token = await _loginUsecase.call(emailId, password);

      state = state.copyWith(isLoading: false, token: token);

      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
      );
      return false;
    }
  }
}
