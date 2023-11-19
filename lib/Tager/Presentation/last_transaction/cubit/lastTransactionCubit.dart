import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager/Tager/Presentation/last_transaction/model/last_transaction_data_model.dart';
import '../../../core/const/dioHelper.dart';
import '../model/last_transacation_model.dart';
import 'last_transaction_state.dart';


class LastTransactionCubit extends Cubit<LastTransactionCubitState> {
  LastTransactionCubit() : super(InitializeLastTransactionCubit());
  LastTransactionModel? lastTransactionModel;
  late List<LastTransactionDataModel> TransactionDataAll=[];
  void getLastTransaction() {
      emit(LastTransactionLoadingState());
      DioHelper.getData(url:'get_transfers').then((value){
      emit(LastTransactionSuccessState());
      print(value);
      lastTransactionModel=LastTransactionModel.fromJson(value.data);
      print(lastTransactionModel!.message);
      print(lastTransactionModel!.transfers?[2].id);
      lastTransactionModel!.transfers!.forEach((element) {
        TransactionDataAll.add(element );
      });
      print(TransactionDataAll[1].amount);
    }).catchError((error) {
      print(error.toString());
      emit(LastTransactionErrorState());
    });
  }
}
