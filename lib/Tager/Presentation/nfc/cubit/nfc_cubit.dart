import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:tager/Tager/Presentation/nfc/screen/password.dart';
import 'package:tager/Tager/Presentation/status/success_screen.dart';
import 'package:tager/Tager/Presentation/verify/screen/password.dart';
import 'package:tager/Tager/core/Navigation/navigation.dart';

import 'package:tager/Tager/core/const/dioHelper.dart';

import '../model/check_nfc_model.dart';
import '../model/nfc_model.dart';
import 'nfc_state.dart';

class NfcCubit extends Cubit<NfcState> {
  NfcCubit() : super(NfcInitializState());

  void goToNfc() async {
    emit(GetNfcLoadingState());
    try {
      var tag = await FlutterNfcKit.poll(
        timeout: Duration(seconds: 10),
        iosMultipleTagMessage: "Multiple tags found!",
        iosAlertMessage: "Scan your tag",
      ).then((tag) {
        print(tag.id);
        emit(GetNfcSuccessState());

        print(tag.id);
      });
    } catch (e) {
      print("Error: $e");

      emit(GetNfcErrorState());
    }
  }

  NfcModel? nfcModel;
  void AddNfc(
      {required String nfcCode,
      required var amount,
      required BuildContext context}) {
    emit(AddNfcLoadingState());
    DioHelper.postData(url: 'add_nfc', data: {'nfc': NfcCode, 'amount': amount})
        .then((value) {
      print(value.data);
      nfcModel = NfcModel.fromJson(value.data);
      navigato(context, PasswordScreen(amount: amount));
      emit(AddNfcSuccessState(nfcModel!));
    }).catchError((error) {
      emit(AddNfcErrorState());
    });
  }

  CheckNfcModel? checknfcModel;
  String? NfcCode;
  String? password;
  var amount;

  void CheckNfc({required password, required NfcCode, required amount}) {
    DioHelper.postData(
            url: 'check_nfc_password',
            data: {'card_id': NfcCode, 'amount': amount, 'password': password})
        .then((value) {
      checknfcModel = CheckNfcModel.fromJson(value.data);
      emit(CheckNfcSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CheckNfcErrorState());
    });
  }
}
