abstract class UserDataState {}

class InitializeUserDataState extends UserDataState {}

class UserDataLoadingState extends UserDataState {}

class UserDataSuccessState extends UserDataState {}

class UserDataErrorState extends UserDataState {}

class UpdateUserDataLoading extends UserDataState {}

class UpdateUserDataSuccess extends UserDataState {
  final String message;
  final String? code;

  UpdateUserDataSuccess( {required this.message,this.code});
}

class UpdateUserDataError extends UserDataState {}
