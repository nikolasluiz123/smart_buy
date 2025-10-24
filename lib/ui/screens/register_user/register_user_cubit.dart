import 'package:bloc/bloc.dart';
import 'package:smart_buy/ui/screens/register_user/register_user_state.dart';

import '../../components/states/page_state.dart';

class RegisterUserCubit extends Cubit<RegisterUserState> {
  RegisterUserCubit(): super(const RegisterUserState.initial());

  Future<void> register(String name, String email, String password, String genericErrorMessage) async {
    emit(state.copyWith(
      pageState: PageState.loading,
      name: name,
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

  Future<void> retryRegister(String genericErrorMessage) async {
    await register(state.name, state.email, state.password, genericErrorMessage);
  }

  void reset() {
    emit(const RegisterUserState.initial());
  }
}