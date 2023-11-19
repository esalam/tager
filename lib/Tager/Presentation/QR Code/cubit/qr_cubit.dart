import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager/Tager/Presentation/QR%20Code/cubit/qr_state_cubit.dart';
import 'package:tager/Tager/core/const/dioHelper.dart';

import '../model/qrModel.dart';

class QrCubit extends Cubit<QrCubitState> {
  QrCubit() : super(InitializeQrCubit());
  QrModel?qrModel;
  var amount;
  void getQr({required amount}) {
    emit(QrLoadingState());
    DioHelper.getData(url:'get_qr/${amount}').then((value){
      emit(QrSuccessState());
     print(value);
      qrModel=QrModel.fromJson(value.data);
      print(qrModel!.QR);

    }).catchError((error) {

      print(error.toString());

        emit(QrErrorState());
    });
  }
}
