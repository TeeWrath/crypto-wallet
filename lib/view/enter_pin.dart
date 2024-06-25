import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:wlt/controller/auth_controller.dart';
import 'package:wlt/controller/wallet_controller.dart';
import 'package:wlt/utils.dart';

class EnterPin extends StatefulWidget {
  const EnterPin({super.key});

  @override
  State<EnterPin> createState() => _EnterPinState();
}

class _EnterPinState extends State<EnterPin> {
  final TextEditingController _pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthController>(context);
    final wallet = Provider.of<WalletController>(context);

    return Scaffold(
      backgroundColor: primaryBgColor,
      appBar: AppBar(
        backgroundColor: primaryBgColor,
        iconTheme: const IconThemeData(color: primaryTextColor),
        centerTitle: true,
        title: const Text(
          "Enter Pincode",
          style: TextStyle(color: primaryTextColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Pincode',
                      style: TextStyle(fontSize: 13, color: primaryTextColor),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),

                // For entering pin
                Pinput(
                    controller: _pinController,
                    length: 6,
                    obscureText: true,
                    defaultPinTheme: PinTheme(
                        height: 50,
                        width: 50,
                        textStyle: const TextStyle(
                            color: primaryTextColor, fontSize: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: primaryBgColor,
                            border: Border.all(color: primaryTextColor)))),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () async {
                      var res = await wallet.transferBalance(
                          token: auth.getFlicToken,
                          recipientAdd: _,
                          amount: amount,
                          pin: _pinController.text);
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        minimumSize: const Size(340, 40),
                        backgroundColor: Colors.blue,
                        overlayColor: secondaryColor),
                    child: const Text(
                      'Transfer',
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