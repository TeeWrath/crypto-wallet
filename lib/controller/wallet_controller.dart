import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wlt/const.dart';
import 'package:wlt/model/wallet_model.dart';

class WalletController extends ChangeNotifier {
  String _publicKey = "";
  String get publicKey => _publicKey;

  void _setPublicKey(String key) {
    _publicKey = key;
    notifyListeners();
  }

  Future<String> createWallet(
      {required String token,
      required String walletName,
      required String network,
      required String pin}) async {
    try {
      var response = await http.post(Uri.https(Api.baseUrl, Api.createWallet),
          headers: {'Flic-Token': token},
          body: json.encode({
            "wallet_name": walletName,
            "network": network,
            "user_pin": pin
          }));
      var data = json.decode(response.body);
      if (response.statusCode == 201) {
        WalletModel walletModel = WalletModel.fromJson(data);
        _setPublicKey(data['publicKey']);
        return data['status'];
      } else if (response.statusCode == 409) {
        print(data['message']);
        return data['message'];
      } else {
        print(data['message']);
        return data['message'];
      }
    } catch (e) {
      debugPrint('Error : $e');
      throw ('error');
    }
  }
}
