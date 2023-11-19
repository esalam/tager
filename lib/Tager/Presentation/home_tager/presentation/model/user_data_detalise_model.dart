// class UserDataDetaliseModel{
//   int? id;
//   String? firstName;
//   String? lastName;
//   String? email;
//   String? countryName;
//   String? phone;
//   String? iD;
//   String? balance;
//   int? todaySales;
//   int? discount;
//   String? activityName;
//   String? lang;
//
//   UserDataDetaliseModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     email = json['email'];
//     countryName = json['country_name'];
//     phone = json['phone'];
//     iD = json['ID'];
//     balance = json['balance'];
//     todaySales = json['today_sales'];
//     discount = json['discount'];
//     activityName = json['activity_name'];
//     lang = json['lang'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['first_name'] = this.firstName;
//     data['last_name'] = this.lastName;
//     data['email'] = this.email;
//     data['country_name'] = this.countryName;
//     data['phone'] = this.phone;
//     data['ID'] = this.iD;
//     data['balance'] = this.balance;
//     data['today_sales'] = this.todaySales;
//     data['discount'] = this.discount;
//     data['activity_name'] = this.activityName;
//     data['lang'] = this.lang;
//     return data;
//   }
// }

class UserDataDetalise {
  int? id;
  Null? img;
  String? firstName;
  String? lastName;
  String? email;
  String? countryName;
  String? phone;
  String? iD;
  String? balance;
  int? todaySales;
  int? discount;
  String? activityName;
  String? lang;



  UserDataDetalise.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    countryName = json['country_name'];
    phone = json['phone'];
    iD = json['ID'];
    balance = json['balance'];
    todaySales = json['today_sales'];
    discount = json['discount'];
    activityName = json['activity_name'];
    lang = json['lang'];
  }


}