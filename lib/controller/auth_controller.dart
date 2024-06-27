import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wlt/const.dart';

class AuthController extends ChangeNotifier {
  // Variable for important properties and states
  bool _isLoading = false;
  bool _hasWallet = true;
  String flicToken = "";

  // Getters
  String get getFlicToken => flicToken;
  bool get hasWallet => _hasWallet;
  bool get isLoading => _isLoading;

  // Setters
  void _setToken(String tkn) {
    flicToken = tkn;
    // print('This is the user Token $flicToken');
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

  // Login Business logic
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

      // debugPrint('Response data: $data');

      if (data['status'] == 'success') {
        setWallet(data['has_wallet']);
        _setToken(data['token']);
        // print(data['token']);
        return data['status'];
      } else {
        debugPrint('Error message: ${data['message']}');
        return data['status'];
      }
    } catch (e) {
      debugPrint('Error: $e');
      return 'error';
    } finally {
      _setLoading(false);
    }
  }
}
