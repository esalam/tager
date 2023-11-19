import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tager/Tager/Presentation/sign_in_tager/Sign_IN_Screen_tager/address_screen.dart';
import 'package:tager/Tager/core/const/consts.dart';

import '../../../core/Navigation/navigation.dart';
import '../../../core/const/dioHelper.dart';
import '../../home_tager/presentation/home_screen/home_screen.dart';
import '../model/user_login_model.dart';
import 'login_view_state.dart';

class LoginViewCubit extends Cubit<LoginViewState> {
  LoginViewCubit() : super(InitializeLoginViewState());

  bool isPassword = true;
  IconData subfix = Icons.visibility_off;
  void changIconPassword() {
    isPassword = !isPassword;
    subfix = isPassword ? Icons.visibility_off : Icons.visibility;
    emit(ChangeIconPasswordSuccess());
  }

  UserLoginModel? userLoginModel;
  void userLogin({required String email, required String password, context}) {
    emit(LoginViewStateLoading());
    DioHelper.postData(url: 'trader_login', data: {
      'email': email,
      'password': password,
      'device_token': fcm,
    }).then((value) {
      print(value.data);
      userLoginModel = UserLoginModel.fromJson(value.data);

      uId = userLoginModel!.token;
      name =
          "${userLoginModel!.user!.firstName!} ${userLoginModel!.user!.firstName!}";
      navigatofinsh(context, AddressScreen(), false);
      Fluttertoast.showToast(
          msg: '${userLoginModel!.message}',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(LoginViewStateSuccess(userLoginModel!));
    }).catchError((error) {
      emit(LoginViewStateError(error.toString()));
      print('ffffffffffffff');
      print(error.toString());
    });
  }

  void SendAddress({
    required String lat,
    required String long,
    required String country,
    required String address,
    required BuildContext context,
  }) {
    emit(SendAddressLoading());
    DioHelper.postData(url: "add_location", data: {
      'lat': lat,
      'long': long,
      'place': country,
      'address': address,
    }).then((value) {
      emit(SendAddressSuccessfully(message: value.data['message']));
       navigatofinsh(context, HomeScreen(), false);
      print(value.data['message']);
    }).catchError((error) {
      emit(SendAddressError(error: error));
      print(error);
    });
  }
}
