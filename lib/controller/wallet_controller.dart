import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wlt/const.dart';
import 'package:wlt/model/wallet_model.dart';

class WalletController extends ChangeNotifier {
  String _publicKey = "";
  String get publicKey => _publicKey;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setPublicKey(String key) {
    _publicKey = key;
    notifyListeners();
  }

  Future<dynamic> getWalletBalance(
      {required String walletAddress,
      var network,
      required String token}) async {
    _setLoading(true);
    try {
      var response = await http.get(
          Uri.https(
              Api.baseUrl,
              Api.getBalance +
                  "?network=${network ?? "devnet"}&wallet_address=$walletAddress"),
          headers: {'Flic-Token': token});
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        _setLoading(false);
        return data['balance'];
      } else {
        _setLoading(false);
        return data['message'];
      }
    } catch (e) {
      debugPrint('Error : $e');
      throw ('Error');
    }
  }

  Future<String> createWallet(
      {required String token,
      required String walletName,
      var network,
      required String pin}) async {
    _setLoading(true);
    try {
      var response = await http.post(Uri.https(Api.baseUrl, Api.createWallet),
          headers: {'Flic-Token': token},
          body: json.encode({
            "wallet_name": walletName,
            "network": network ?? "devnet",
            "user_pin": pin
          }));
      var data = json.decode(response.body);
      if (response.statusCode == 201) {
        // WalletModel walletModel = WalletModel.fromJson(data);
        _setPublicKey(data['publicKey']);
        _setLoading(false);
        return data['status'];
      } else if (response.statusCode == 409) {
        print(data['message']);
        _setLoading(false);
        return data['message'];
      } else {
        print(data['message']);
        _setLoading(false);
        return data['message'];
      }
    } catch (e) {
      debugPrint('Error : $e');
      _setLoading(false);
      throw ('error');
    }
  }
}
