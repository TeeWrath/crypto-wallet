import 'package:flutter/material.dart';
import 'package:wlt/utils.dart';
import 'package:wlt/view/enter_wallet_details.dart';

class CreateWalletScreen extends StatelessWidget {
  const CreateWalletScreen({super.key});

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
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const EnterWalletDetails()));
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: textFieldFillColor,
                        overlayColor: secondaryColor),
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
