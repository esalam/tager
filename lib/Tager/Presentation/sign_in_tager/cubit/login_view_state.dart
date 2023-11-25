import '../model/user_login_model.dart';

abstract class LoginViewState {}

class InitializeLoginViewState extends LoginViewState {}

class LoginViewStateLoading extends LoginViewState {}

class LoginViewStateSuccess extends LoginViewState {
  final String message;
  LoginViewStateSuccess({required this.message});
}

class LoginViewStateError extends LoginViewState {
  final String error;
  LoginViewStateError(this.error);
}

class ChangeIconPasswordSuccess extends LoginViewState {}

class SendAddressLoading extends LoginViewState {}

class SendAddressSuccessfully extends LoginViewState {}

class SendAddressError extends LoginViewState {}
