import 'package:flutter/material.dart';
import 'package:wlt/utils.dart';

class EnterWalletDetails extends StatefulWidget {
  const EnterWalletDetails({super.key});

  @override
  State<EnterWalletDetails> createState() => _EnterWalletDetailsState();
}

class _EnterWalletDetailsState extends State<EnterWalletDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBgColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
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
                    style: TextStyle(fontSize: 13,color: primaryTextColor),
                  ),
                ),
                const TextField(
                  // controller: _mixedController,
                  style: TextStyle(color: primaryTextColor),
                  decoration: InputDecoration(
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
                const SizedBox(height: 20,),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'PinCode',
                    style: TextStyle(fontSize: 13,color: primaryTextColor),
                  ),
                ),
                const TextField(
                  // controller: _mixedController,
                  obscureText: true,
                  style: TextStyle(color: primaryTextColor),
                  decoration: InputDecoration(
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
                const SizedBox(height: 30,),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.blue,
                      overlayColor: secondaryColor
                    ),
                    child: const Text(
                      'Create',
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
