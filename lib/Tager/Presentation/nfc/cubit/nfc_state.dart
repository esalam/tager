import '../model/check_nfc_model.dart';
import '../model/nfc_model.dart';

abstract class NfcState{}
class NfcInitializState extends NfcState{}

class GetNfcLoadingState extends  NfcState{}
class GetNfcSuccessState extends  NfcState{}
class GetNfcErrorState extends  NfcState{}


class AddNfcLoadingState extends  NfcState{}
class AddNfcSuccessState extends  NfcState{

  final  NfcModel nfcModel;
  AddNfcSuccessState(this.nfcModel);
}
class AddNfcErrorState extends  NfcState{}

class CheckNfcLoadingState extends  NfcState{}
class CheckNfcSuccessState extends  NfcState{

}
class CheckNfcErrorState extends  NfcState{}