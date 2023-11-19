class LastTransactionDataModel{

  int? id;
  String? acountNumber;
  String? soldToFirstName;
  String? soldToLastName;
  String? date;
  String? amount;
  String? by;



  LastTransactionDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    acountNumber = json['acount_number'];
    soldToFirstName = json['sold_to_first_name'];
    soldToLastName = json['sold_to_last_name'];
    date = json['Date'];
    amount = json['amount'];
    by = json['by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['acount_number'] = this.acountNumber;
    data['sold_to_first_name'] = this.soldToFirstName;
    data['sold_to_last_name'] = this.soldToLastName;
    data['Date'] = this.date;
    data['amount'] = this.amount;
    data['by'] = this.by;
    return data;
  }
}