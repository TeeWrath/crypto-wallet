import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wlt/const.dart';

class WalletController extends ChangeNotifier {
  // Variables to store important values and states
  String _publicKey = "";
  String _balance = "Not fetched";
  String _recipientAdd = "";  
  bool _isLoading = false;

  // Getters
  String get recipientAdd => _recipientAdd;
  String get balance => _balance;
  String get publicKey => _publicKey;
  bool get isLoading => _isLoading;

  void addRecipientAdd(TextEditingController add) {
    _recipientAdd = add.text;
    notifyListeners();
  }

  // Setters
  void _setBalance(String bal) {
    _balance = bal;
    notifyListeners();
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setPublicKey(String key) {
    _publicKey = key;
    // print('this is public key => '+ key);
    notifyListeners();
  }

  Future<String> getWalletBalance(
      {required String walletAddress,
      var network,
      required String token}) async {
    try {
      var uri = Uri.https(
        "api.socialverseapp.com",
        "/solana/wallet/balance",
        {"network": network ?? "devnet", "wallet_address": walletAddress},
      );
      var response = await http.get(uri, headers: {'Flic-Token': token});
      var data = json.decode(response.body);
      // print(response.statusCode);
      if (response.statusCode == 200) {
        // print(data);
        _setBalance(data['balance'].toString());
        return data['balance'].toString();
      } else {
        // print(data);
        return data['message'];
      }
    } catch (e) {
      debugPrint('Error : $e');
      throw ('Error');
    }
  }

  Future<String> transferBalance(
      {required String token,
      required String recipientAdd,
      required int amount,
      required String pin}) async {
    _setLoading(true);
    try {
      var response =
          await http.post(Uri.https(Api.baseUrl, Api.transferBalance),
              headers: {'Flic-Token': token},
              body: json.encode({
                "recipient_address": recipientAdd,
                "network": "devnet",
                // "sender_address": publicKey,
                "sender_address":
                    "CgkPHJSpAQ52CRKPZrd5SH5yNTnEeSBTCCVMqQ7ZjaeS",
                "amount": amount,
                "user_pin": pin
              }));
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        // print(data);
        return data['status'];
      } else {
        // print(data);
        return data['message'];
      }
    } catch (e) {
      debugPrint("Error : $e");
      throw ('$e');
    } finally {
      _setLoading(false);
    }
  }

  Future<String> requestAirdrop(
      {required String token, var network, required int amount}) async {
    _setLoading(true);
    try {
      var response = await http.post(Uri.https(Api.baseUrl, Api.requestAirDrop),
          headers: {'Flic-Token': token},
          body: json.encode({
            // "wallet_address": publicKey,
            "wallet_address": "CgkPHJSpAQ52CRKPZrd5SH5yNTnEeSBTCCVMqQ7ZjaeS",
            "network": "devnet",
            "amount": amount
          }));
      var data = json.decode(response.body);
      if (response.statusCode == 500) {
        // print(data);
        return data['message'];
      } else {
        // print(data);
        return data['message'];
      }
    } catch (e) {
      debugPrint('Error : $e');
      throw ("$e");
    } finally {
      _setLoading(false);
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
            "network": network ?? "mainnet-beta",
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
