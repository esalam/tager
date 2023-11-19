class NfcModel{
  dynamic? status;
  dynamic? message;
  dynamic? cardId;
  dynamic? amount;



  NfcModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    cardId = json['card_id']!= null?json['card_id']:null;
    amount = json['amount']!=null?json['amount']:null;
  }


}