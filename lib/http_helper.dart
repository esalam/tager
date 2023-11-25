import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tager/Tager/core/const/consts.dart';

class HttpHelper {
  static const String baseUrl = "https://wallet.acwad-it.com/api/";

  static Future<Map<String, dynamic>> postData({
    required String endpoint,
    Map<String, dynamic>? query,
    required Map<String, dynamic> body,
    String? token,
  }) async {
    final url = Uri.parse(baseUrl + endpoint);
    // var token = CacheHelper.getDataFromSharedPreference(key: 'token');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Accept-Language': 'en',
          'Authorization': 'Bearer $uId',
          // Add any additional headers, such as authentication tokens, if needed.
        },
        body: jsonEncode(body),
      );
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } catch (error) {
      throw Exception('Failed to post data: $error');
    }
  }

  static Future<Map<String, dynamic>> getData({
    required String endpoint,
    Map<String, dynamic>? query,
  }) async {
    final url = Uri.parse(baseUrl + endpoint);
    // var token = CacheHelper.getDataFromSharedPreference(key: 'token');
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Accept-Language': 'en',
          'Authorization': 'Bearer $uId',
        },
      );
      if (response.statusCode == 201) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load data: $error');
    }
  }
}
