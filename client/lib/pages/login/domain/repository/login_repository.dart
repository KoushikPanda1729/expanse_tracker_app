import 'package:expensetracker/commons/domain/token_entity.dart';

abstract class LoginRepository {
  Future<TokenEntity> logintoAccount(String email, String password);
}
