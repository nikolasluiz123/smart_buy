import 'package:flutter/foundation.dart';

import '../../components/states/page_state.dart';

@immutable
class RegisterUserState {
  final PageState pageState;
  final String errorMessage;
  final String name;
  final String email;
  final String password;

  const RegisterUserState({
    required this.pageState,
    this.errorMessage = '',
    this.name = '',
    this.email = '',
    this.password = '',
  });

  const RegisterUserState.initial() : pageState = PageState.initial, errorMessage = '', name = '', email = '', password = '';

  RegisterUserState copyWith({
    PageState? pageState,
    String? errorMessage,
    String? name,
    String? email,
    String? password,
  }) {
    return RegisterUserState(
      pageState: pageState ?? this.pageState,
      errorMessage: errorMessage ?? this.errorMessage,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegisterUserState &&
          runtimeType == other.runtimeType &&
          pageState == other.pageState &&
          errorMessage == other.errorMessage &&
          name == other.name &&
          email == other.email &&
          password == other.password;

  @override
  int get hashCode => Object.hash(pageState, errorMessage, name, email, password);
}
