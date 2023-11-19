// class UserDataLoginModel {
//   int? id;
//   String? first_name;
//   String? last_name;
//   String? email;
//   int? country_id;
//   String? country_name;
//   String? phone;
//   String? lang;
//
//
//
//   UserDataLoginModel.fromJson({required Map<String, dynamic> json}) {
//     id = json['id'];
//     first_name = json['first_name'];
//     last_name = json['last_name'];
//     email = json['email'];
//     country_id = json['country_id'];
//     country_name = json['country_name'];
//     phone = json['phone'];
//     lang = json['lang'];
//
//
//
//   }
// }

class UserData {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  int? countryId;
  String? countryName;
  String? phone;
  String? lang;



  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    countryId = json['country_id'];
    countryName = json['country_name'];
    phone = json['phone'];
    lang = json['lang'];
  }


}