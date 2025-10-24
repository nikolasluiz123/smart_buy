import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_buy/ui/components/states/page_state.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState.initial());

  Future<void> signIn(String email, String password, String genericErrorMessage) async {
    emit(state.copyWith(
      pageState: PageState.loading,
      email: email,
      password: password,
    ));

    // Simulação de chamada de API
    await Future.delayed(const Duration(seconds: 2));

    // Simulação de um erro
    emit(state.copyWith(
      pageState: PageState.error,
      errorMessage: genericErrorMessage,
    ));
  }

  Future<void> retrySignIn(String genericErrorMessage) async {
    await signIn(state.email, state.password, genericErrorMessage);
  }

  void reset() {
    emit(const LoginState.initial());
  }
}