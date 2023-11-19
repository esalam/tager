import '../model/user_login_model.dart';

abstract class LoginViewState {}

class InitializeLoginViewState extends LoginViewState {}

class LoginViewStateLoading extends LoginViewState {}

class LoginViewStateSuccess extends LoginViewState {
  final UserLoginModel userLoginModel;
  LoginViewStateSuccess(this.userLoginModel);
}

class LoginViewStateError extends LoginViewState {
  final String error;
  LoginViewStateError(this.error);
}

class ChangeIconPasswordSuccess extends LoginViewState {}

class SendAddressLoading extends LoginViewState {}

class SendAddressSuccessfully extends LoginViewState {
  final String message;

  SendAddressSuccessfully({required this.message});
}

class SendAddressError extends LoginViewState {
  final String error;

  SendAddressError({required this.error});
}
