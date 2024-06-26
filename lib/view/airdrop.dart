import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt/controller/wallet_controller.dart';
import 'package:wlt/utils.dart';
import 'package:wlt/widgets/progress_indicator.dart';

class AirdropScreen extends StatefulWidget {
  const AirdropScreen({super.key});

  @override
  State<AirdropScreen> createState() => _AirdropScreenState();
}

class _AirdropScreenState extends State<AirdropScreen> {
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final wallet = Provider.of<WalletController>(context);
    return Scaffold(
      backgroundColor: primaryBgColor,
      appBar: AppBar(
        backgroundColor: primaryBgColor,
        iconTheme: const IconThemeData(color: primaryTextColor),
        centerTitle: true,
        title: const Text(
          'Request Airdrop',
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
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Enter Amount',
                    style: TextStyle(fontSize: 13, color: primaryTextColor),
                  ),
                ),
                TextField(
                  controller: _amountController,
                  style: const TextStyle(color: primaryTextColor),
                  decoration: const InputDecoration(
                    hintText: 'Enter amount of airdrop',
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
                wallet.isLoading
                    ? const ProgressIndicatorCustom()
                    : ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor: Colors.blue,
                            overlayColor: secondaryColor),
                        child: const Text(
                          'Send Request',
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
