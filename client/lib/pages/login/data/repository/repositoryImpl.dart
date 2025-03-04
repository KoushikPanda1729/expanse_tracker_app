import 'package:expensetracker/commons/domain/token_entity.dart';
import 'package:expensetracker/pages/login/data/datasources/login_datasource.dart';
import 'package:expensetracker/pages/login/domain/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource _datasource;

  LoginRepositoryImpl(this._datasource);

  @override
  Future<TokenEntity> logintoAccount(String email, String password) async {
    try {
      final tokenModel =
          await _datasource.loginWithEmailAndPassword(email, password);
      return tokenModel.toEntity();
    } catch (e) {
      throw Exception('Login failed: ${e.toString()}');
    }
  }
}
