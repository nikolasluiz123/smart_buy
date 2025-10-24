import 'package:flutter/foundation.dart';
import 'package:smart_buy/ui/components/states/page_state.dart';

@immutable
class LoginState {
  final PageState pageState;
  final String errorMessage;
  final String email;
  final String password;

  const LoginState({
    required this.pageState,
    this.errorMessage = '',
    this.email = '',
    this.password = '',
  });

  const LoginState.initial() : pageState = PageState.initial, errorMessage = '', email = '', password = '';

  LoginState copyWith({
    PageState? pageState,
    String? errorMessage,
    String? email,
    String? password,
  }) {
    return LoginState(
      pageState: pageState ?? this.pageState,
      errorMessage: errorMessage ?? this.errorMessage,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginState &&
        other.pageState == pageState &&
        other.errorMessage == errorMessage &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return pageState.hashCode ^
    errorMessage.hashCode ^
    email.hashCode ^
    password.hashCode;
  }
}