import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tager/Tager/Presentation/sign_in_tager/Sign_IN_Screen_tager/address_screen.dart';
import 'package:tager/Tager/core/const/chacheHelper.dart';
import 'package:tager/Tager/core/const/consts.dart';
import 'package:tager/http_helper.dart';

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

  void userLogin(
      {required String email, required String password, context}) async {
    try {
      emit(LoginViewStateLoading());
      var fcmToken = CacheHelper.getDataFromSharedPreference(key: "fcm");
      print(fcmToken);
      var response = await HttpHelper.postData(
        endpoint: "trader_login",
        body: {
          'email': email,
          'password': password,
          'device_token': fcmToken,
        },
      );
      print(response);
      if (response['status'] == true) {
         navigato(context, AddressScreen());
        uId=response['token'];
        Fluttertoast.showToast(
            msg: response['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
      
      } else {
        Fluttertoast.showToast(
            msg: response['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      emit(LoginViewStateSuccess(message: "sfd"));
    } catch (error) {
      Fluttertoast.showToast(
          msg: "Please Try Again",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    emit(LoginViewStateError("sdfsd"));
  }

  void SendAddress({
    required String lat,
    required String long,
    required String country,
    required String address,
    required BuildContext context,
  }) async {
    emit(SendAddressLoading());
    try {
      var response = await HttpHelper.postData(
        endpoint: "add_location",
        body: {
          'lat': lat,
          'long': long,
          'place': country,
          'address': address,
        },
      );
      if (response['status'] == true) {
        Fluttertoast.showToast(
            msg: response['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
            navigatofinsh(context, HomeScreen(), false);
      } else {
        Fluttertoast.showToast(
            msg: response['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      emit(SendAddressSuccessfully());
    } catch (error) {
      emit(SendAddressError());
      print(error);
    }
  }
}
