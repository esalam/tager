


// import 'package:tager/Tager/Presentation/sign_in_tager/model/user_data_login_model.dart';
//
// class UserLoginModel {
//    bool? status;
//   String? message;
//   UserDataLoginModel? data;
//   String? token;
//
//   UserLoginModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? UserDataLoginModel.fromJson(json: json['data']) : null;
//     token=json['token'];
//   }
// }

import 'package:tager/Tager/Presentation/sign_in_tager/model/user_data_login_model.dart';

class UserLoginModel {
  bool? status;
  String? message;
  UserData? user;
  bool?address;
  String? token;

  UserLoginModel({this.status, this.message, this.user, this.token,this.address});

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? new UserData.fromJson(json['user']) : null;
    address=json['address'];
    token = json['token'];

  }


}