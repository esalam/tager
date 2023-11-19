
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'consts.dart';

class DioHelper{

  static late Dio dio;
  static init()
  {
    dio=Dio(BaseOptions(baseUrl:'https://wallet.acwad-it.com/api/',



      receiveDataWhenStatusError: true,

    ));
  }


  static Future<Response>getData({required String url})async
  {

    dio.options.headers={
      'Accept': 'application/json',
      'Accept-Language': 'ar',
      'Authorization': 'Bearer ${uId}'

    };



    return await dio.get(url);
  }

  static Future<Response>postData({required String url, Map<String,dynamic>? data, String?token })async
  {dio.options.headers={
    'Accept':'application/json',
    'Accept-Language':'ar',
  };
  dio.options.headers["Authorization"] = "Bearer ${uId}";

  return   dio.post(url,data: data);
  }

  static Future<Response>putData({required String url,Map<String,dynamic> ?data,String?token })async
  {

    return   dio.put(url,data: data);
  }

}