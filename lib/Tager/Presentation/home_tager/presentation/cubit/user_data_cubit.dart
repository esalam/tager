import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager/Tager/Presentation/home_tager/presentation/cubit/user_data_state.dart';
import 'package:tager/Tager/Presentation/home_tager/presentation/home_screen/home_screen.dart';
import 'package:tager/Tager/Presentation/profile/screen/confirm_email_screen.dart';
import 'package:tager/Tager/Presentation/profile/screen/confirm_phone_screen.dart';
import 'package:tager/Tager/core/Navigation/navigation.dart';

import '../../../../core/const/dioHelper.dart';
import '../../../sign_in_tager/model/user_login_model.dart';
import '../model/user_data_model.dart';

class userDataCubit extends Cubit<UserDataState> {
  userDataCubit() : super(InitializeUserDataState());
  UserData? userDataModel;
  void getUserData() {
    emit(UserDataLoadingState());
    DioHelper.getData(url: 'trader').then((value) {
      userDataModel = UserData.fromJson(value.data);
      emit(UserDataSuccessState());
      print(userDataModel!.trader!.firstName);
      print(userDataModel!.message);
      print(value.data);
    }).catchError((error) {
      print(error);
      emit(UserDataErrorState());
    });
  }

  void updateEmailProfileData(
      {required String email, required BuildContext context}) {
    emit(UpdateUserDataLoading());
    DioHelper.postData(url: 'edit_trader', data: {
      'email': email,
    }).then((value) {
      emit(UpdateUserDataSuccess(message: "Check Your Email $email"));
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ConfirmEmailScreen(code: value.data['email_code'], email: email);
      }));
    }).catchError((error) {
      emit(UpdateUserDataError());
    });
  }

  void updatePhoneProfileData({required String phone,required BuildContext context}) {
    emit(UpdateUserDataLoading());
    DioHelper.postData(url: 'edit_trader', data: {
      'phone': phone,
    }).then((value) {
      emit(UpdateUserDataSuccess(message: "Send Sms to $phone"));
      // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //   return ConfirmPhoneScreen(code: value.data['email_code'], email: email);
      // }));
    }).catchError((error) {
      emit(UpdateUserDataError());
    });
  }

  void confirmEmail(
      {required String email,
      required String code,
      required BuildContext context}) {
    emit(UpdateUserDataLoading());
    DioHelper.postData(url: 'check_mail', data: {
      'email': email,
      'email_code': "${int.parse(code)}",
    }).then((value) {
      print(value);
      emit(UpdateUserDataSuccess(message: "Confirm Your Email Successfully"));
      navigatofinsh(context, HomeScreen(), false);
    }).catchError((error) {
      print(error);
      emit(UpdateUserDataError());
    });
  }

  void confirmPhone(
      {required String phone,
      required String code,
      required BuildContext context}) {
    emit(UpdateUserDataLoading());
    DioHelper.postData(url: 'checksms', data: {
      'phone': phone,
      'phone_code': "${int.parse(code)}",
    }).then((value) {
      print(value);
      emit(UpdateUserDataSuccess(message: "Confirm Your Phone Successfully"));
      navigatofinsh(context, HomeScreen(), false);
    }).catchError((error) {
      print(error);
      emit(UpdateUserDataError());
    });
  }
}
