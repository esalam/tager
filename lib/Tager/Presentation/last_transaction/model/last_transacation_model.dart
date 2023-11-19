import 'last_transaction_data_model.dart';

class LastTransactionModel{
  bool? status;
  String? message;
  List<LastTransactionDataModel>? transfers;



  LastTransactionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['transfers'] != null) {
      transfers = <LastTransactionDataModel>[];
      json['transfers'].forEach((v) {
        transfers!.add(new LastTransactionDataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.transfers != null) {
      data['transfers'] = this.transfers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}