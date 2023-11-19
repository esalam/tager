part of 'app_cubit.dart';

@immutable
abstract class AppState {}
//// Initial state
class AppInitial extends AppState {}
//// Get Branches
class AppGetBranchesLoadingState extends AppState {}
class AppGetBranchesSuccessState extends AppState {}
class AppGetBranchesErrorState extends AppState {}
/// Get Current location
class AppGetLocationLoadingState extends AppState {}
class AppGetLocationSuccessState extends AppState {}
/// update marker
class AppMarkerUpdateState extends AppState {}
/// Add city , address
class AddCityState  extends AppState {}
class AddAddressState extends AppState {}
/// Add location
class AppAddLocationLoadingState extends AppState {}
class AppAddLocationSuccessState extends AppState {}
class AppAddLocationErrorState extends AppState {}
