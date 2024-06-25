import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt/controller/auth_controller.dart';
import 'package:wlt/controller/wallet_controller.dart';
import 'package:wlt/utils.dart';
import 'package:wlt/view/home_view.dart';
import 'package:wlt/widgets/progress_indicator.dart';

class EnterWalletDetails extends StatefulWidget {
  const EnterWalletDetails({super.key});

  @override
  State<EnterWalletDetails> createState() => _EnterWalletDetailsState();
}

class _EnterWalletDetailsState extends State<EnterWalletDetails> {
  final TextEditingController _walletNameController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _walletNameController.dispose();
    _pinCodeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final wallet = Provider.of<WalletController>(context);
    final auth = Provider.of<AuthController>(context);

    return Scaffold(
      backgroundColor: primaryBgColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: primaryTextColor),
        centerTitle: true,
        title: const Text(
          'Create Wallet',
          style: TextStyle(color: primaryTextColor),
        ),
        backgroundColor: primaryBgColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Wallet Name',
                    style: TextStyle(fontSize: 13, color: primaryTextColor),
                  ),
                ),
                TextField(
                  controller: _walletNameController,
                  style: const TextStyle(color: primaryTextColor),
                  decoration: const InputDecoration(
                    hintText: 'Eg. Ritik\'s Wallet',
                    hintStyle: TextStyle(fontSize: 13, color: primaryTextColor),
                    filled: true,
                    fillColor: textFieldFillColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'PinCode',
                    style: TextStyle(fontSize: 13, color: primaryTextColor),
                  ),
                ),
                TextField(
                  controller: _pinCodeController,
                  obscureText: true,
                  style: const TextStyle(color: primaryTextColor),
                  decoration: const InputDecoration(
                    hintText: 'Eg. 6 digit numeric pin',
                    hintStyle: TextStyle(fontSize: 13, color: primaryTextColor),
                    filled: true,
                    fillColor: textFieldFillColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                wallet.isLoading
                    ? const ProgressIndicatorCustom()
                    : ElevatedButton(
                        onPressed: () async {
                          var res = await wallet.createWallet(
                              token: auth.getFlicToken,
                              walletName: _walletNameController.text,
                              pin: _pinCodeController.text);
                          if (res == 'success') {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor: Colors.blue,
                            overlayColor: secondaryColor),
                        child: const Text(
                          'Create',
                          style: TextStyle(color: primaryTextColor),
                        )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
