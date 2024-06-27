import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:wlt/controller/auth_controller.dart';
import 'package:wlt/controller/wallet_controller.dart';
import 'package:wlt/utils.dart';
import 'package:wlt/view/home_view.dart';
import 'package:wlt/widgets/progress_indicator.dart';

class EnterPin extends StatefulWidget {
  final String amount;

  const EnterPin({super.key, required this.amount});

  @override
  State<EnterPin> createState() => _EnterPinState();
}

class _EnterPinState extends State<EnterPin> {
  final TextEditingController _pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthController>(context);
    final wallet = Provider.of<WalletController>(context);
    int amnt;
    // Converting amount to int to pass in request body
    try {
      amnt = int.parse(widget.amount);
    } catch (e) {
      // Handling the error and assigning a default value or log the error
      amnt = 0; // or some default value
      // print('Error parsing amount: $e');
    }

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

                // For entering pin (external package)
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
                wallet.isLoading
                    ? const ProgressIndicatorCustom()
                    : ElevatedButton(
                        onPressed: () async {
                          var res = await wallet.transferBalance(
                              token: auth.getFlicToken,
                              recipientAdd: wallet.recipientAdd,
                              amount: amnt,
                              pin: _pinController.text);
                          ScaffoldMessenger.of(context).removeCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(res),
                            duration: const Duration(seconds: 4),
                          ));
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => const HomeScreen()));
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
