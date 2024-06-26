import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt/controller/wallet_controller.dart';
import 'package:wlt/utils.dart';
import 'package:wlt/view/enter_pin.dart';
import 'package:wlt/widgets/enter_amount.dart';
import 'package:wlt/widgets/progress_indicator.dart';

class BalanceTransferScreen extends StatefulWidget {
  const BalanceTransferScreen({super.key});

  @override
  State<BalanceTransferScreen> createState() => _BalanceTransferScreenState();
}

class _BalanceTransferScreenState extends State<BalanceTransferScreen> {
  final TextEditingController _recipentAddressController =
      TextEditingController();
  String amount = '';

  @override
  Widget build(BuildContext context) {
    final wallet = Provider.of<WalletController>(context);
    return Scaffold(
      backgroundColor: primaryBgColor,
      appBar: AppBar(
        backgroundColor: primaryBgColor,
        title: const Text(
          'Send',
          style: TextStyle(color: primaryTextColor),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: primaryTextColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _recipentAddressController,
                  style: const TextStyle(color: primaryTextColor),
                  decoration: const InputDecoration(
                    suffixIcon: Icon(
                      Icons.wallet_outlined,
                      color: primaryTextColor,
                    ),
                    hintText: 'Recipient Address',
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
                  height: 15,
                ),
                EnterAmount(
                  onUserInput: (input) {
                    setState(() {
                      amount = input;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                wallet.isLoading
                    ? const ProgressIndicatorCustom()
                    : ElevatedButton(
                        onPressed: () {
                          wallet.addRecipientAdd(_recipentAddressController);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => EnterPin(amount: amount),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.blue,
                          overlayColor: secondaryColor,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text(
                          'Send',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
