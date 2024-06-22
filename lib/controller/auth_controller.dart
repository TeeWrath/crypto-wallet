import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wlt/const.dart';
import 'package:wlt/model/user_model.dart';

class AuthController {

  Future<String> loginUser(
      {required String mixed, required String password}) async {
    try {
      var response = await http.post(Uri.https(Api.baseUrl, Api.userLogin),
          headers: {"Content-Type": "application/json"},
          body: json.encode({
            'mixed': mixed,
            'password': password,
          }));
      var data = json.decode(response.body);
      UserModel userModel = UserModel.fromJson(data);
      if (data['status'] == 'success') {
        print(data);
        print(userModel.token);
        return data['status'];
      } else {
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$response.')));
        print(data['message']);
        return data['status'];
      }
    } catch (e) {
      debugPrint('Error : $e');
      throw ('$e');
    }
  }
}
