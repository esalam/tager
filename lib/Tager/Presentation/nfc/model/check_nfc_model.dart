class CheckNfcModel{

  bool? status;
  String? message;

  CheckNfcModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

  }



}