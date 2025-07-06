import 'package:expensetracker/commons/domain/token_entity.dart';
import 'package:expensetracker/pages/login/domain/repository/login_repository.dart';

class LoginUsecase {
  final LoginRepository _repository;

  LoginUsecase(this._repository);

  Future<TokenEntity> call(String email, String password) async {
    return await _repository.logintoAccount(email, password);
  }
}
