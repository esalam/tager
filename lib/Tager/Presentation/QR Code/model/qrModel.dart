class QrModel{
bool ? status;
String?message;
String?QR;

QrModel.fromJson(Map<String, dynamic> json) {
  status = json['status'];
  message = json['message'];
  QR = json['QR'];
}
Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = Map<String, dynamic>();
  data['status'] = this.status;
  data['message'] = this.message;
  data['QR'] = this.QR;
  return data;
}

}

