import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wlt/const.dart';

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

  Future<String> getWalletBalance(
      {required String walletAddress,
      var network = "devnet",
      required String token}) async {
    print('get balance is called');
    try {
      var uri = Uri.https(
        "api.socialverseapp.com",
        "/solana/wallet/balance",
        {"network": network ?? "devnet", "wallet_address": walletAddress},
      );
      var response = await http.get(uri, headers: {'Flic-Token': token});
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        print(data);
        return data['balance'].toString();
      } else {
        print(data);
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
        _setPublicKey(data['publicKey']);
        return data['status'];
      } else if (response.statusCode == 409) {
        return data['message'];
      } else {
        return data['message'];
      }
    } catch (e) {
      debugPrint('Error : $e');
      throw ('error');
    } finally {
      _setLoading(false);
    }
  }
}
