import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wlt/const.dart';
import 'package:wlt/model/user_model.dart';

class AuthController extends ChangeNotifier {
  bool _isLoading = false;
  bool _hasWallet = true;
  String flicToken = "";
  String get getFlicToken => flicToken;
  bool get hasWallet => _hasWallet;
  bool get isLoading => _isLoading;

  void _setToken(String tkn) {
    flicToken = tkn;
    notifyListeners();
  }

  void setWallet(bool wallet) {
    _hasWallet = wallet;
    notifyListeners();
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<String> loginUser(
      {required String mixed, required String password}) async {
    _setLoading(true);
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
        _setLoading(false);
        return 'error';
      }

      var data = json.decode(response.body);
      if (data == null || data.isEmpty) {
        debugPrint('Error: Empty response body');
        _setLoading(false);
        return 'error';
      }

      debugPrint('Response data: $data');

      if (data['status'] == 'success') {
        UserModel userModel = UserModel.fromJson(data);
        debugPrint('User token: ${userModel.token}');
        setWallet(data['has_wallet']);
        _setToken(data['token']);
        _setLoading(false);
        return data['status'];
      } else {
        debugPrint('Error message: ${data['message']}');
        _setLoading(false);
        return data['status'];
      }
    } catch (e) {
      debugPrint('Error: $e');
      _setLoading(false);
      return 'error';
    }
  }
}
