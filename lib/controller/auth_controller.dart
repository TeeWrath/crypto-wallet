import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wlt/const.dart';
import 'package:wlt/model/user_model.dart';

class AuthController {
  bool isLoading = false;
  Future<String> loginUser(
      {required String mixed, required String password}) async {
    isLoading = true;
    try {
      var response = await http.post(
        Uri.https(Api.baseUrl, Api.userLogin),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          'mixed': mixed,
          'password': password,
        }),
      );

      if (response.statusCode != 200) {
        debugPrint('Error: HTTP status ${response.statusCode}');
        isLoading = false;
        return 'error';
      }

      var data = json.decode(response.body);
      if (data == null || data.isEmpty) {
        debugPrint('Error: Empty response body');
        isLoading = false;
        return 'error';
      }

      debugPrint('Response data: $data');

      if (data['status'] == 'success') {
        UserModel userModel = UserModel.fromJson(data);
        debugPrint('User token: ${userModel.token}');
        isLoading = false;
        return data['status'];
      } else {
        debugPrint('Error message: ${data['message']}');
        isLoading = false;
        return data['status'];
      }
    } catch (e) {
      debugPrint('Error: $e');
      return 'error';
    }
  }
}
