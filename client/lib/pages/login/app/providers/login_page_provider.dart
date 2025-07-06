import 'package:expensetracker/commons/provider/dio_client_provider.dart';
import 'package:expensetracker/pages/login/app/viewmodels/login_state.dart';
import 'package:expensetracker/pages/login/app/viewmodels/login_view_model.dart';
import 'package:expensetracker/pages/login/data/datasources/login_datasource.dart';
import 'package:expensetracker/pages/login/data/repository/repositoryImpl.dart';
import 'package:expensetracker/pages/login/domain/repository/login_repository.dart';
import 'package:expensetracker/pages/login/domain/usecase/login_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider for LoginDatasource
final loginDatasourceProvider = Provider<LoginDatasource>((ref) {
  final dioClient = ref.read(dioClientProvider);
  print("---->dio in provicer $dioClient");
  return LoginDatasource(dioClient);
});

// Provider for LoginRepository
final loginRepositoryProvider = Provider<LoginRepository>((ref) {
  final datasource = ref.read(loginDatasourceProvider);
  return LoginRepositoryImpl(datasource);
});

// Provider for LoginUsecase
final loginUsecaseProvider = Provider<LoginUsecase>((ref) {
  final repository = ref.read(loginRepositoryProvider);
  return LoginUsecase(repository);
});

// Provider for LoginViewModel
final loginProvider = StateNotifierProvider<LoginViewModel, LoginPageState>(
  (ref) {
    final loginUsecase = ref.read(loginUsecaseProvider);
    return LoginViewModel(loginUsecase);
  },
);
