import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt/controller/auth_controller.dart';
import 'package:wlt/controller/wallet_controller.dart';
import 'package:wlt/utils.dart';

class CreateWalletScreen extends StatefulWidget {
  const CreateWalletScreen({super.key});

  @override
  State<CreateWalletScreen> createState() => _CreateWalletScreenState();
}

class _CreateWalletScreenState extends State<CreateWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBgColor,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to your Solana Wallet. Your wallet is a gateway to the decentralised web. You can use it to store, send and receive cryptocurrencies.',
                  style: TextStyle(color: primaryTextColor),
                ),
                const SizedBox(
                  height: 250,
                ),
                Image.asset(
                  'assets/solanaLogoMark.png',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(
                  height: 200,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: textFieldFillColor,
                      overlayColor: secondaryColor
                    ),
                    child: const Text(
                      'Create Wallet',
                      style: TextStyle(color: primaryTextColor),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
