import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt/controller/wallet_controller.dart';
import 'package:wlt/utils.dart';
import 'package:wlt/widgets/my_button.dart';

class EnterAmount extends StatefulWidget {
  final Function(String) onUserInput;

  const EnterAmount({super.key, required this.onUserInput});

  @override
  State<EnterAmount> createState() => _EnterAmountState();
}

class _EnterAmountState extends State<EnterAmount> {
  // List of buttons to take user input
  final List<String> buttons = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '.',
    '0',
    'DEL'
  ];

  var userInput = '';

  @override
  Widget build(BuildContext context) {
    final wallet = Provider.of<WalletController>(context);
    return Column(
      children: [
        Text(
          '${wallet.balance} - $userInput',
          style: const TextStyle(fontSize: 18, color: primaryTextColor),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 500,
          child: GridView.builder(
            // UI for buttons
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: buttons.length,
            itemBuilder: (BuildContext context, int index) {
              // Logic for decimal button
              if (index == 9) {
                return MyButton(
                  buttonText: buttons[index],
                  buttontapped: () {
                    setState(() {
                      if (!userInput.contains('.')) {
                        userInput += buttons[index];
                        widget.onUserInput(userInput);
                      }
                    });
                  },
                );
              }
              // Logic for delete (DEL) button
              else if (index == 11) {
                return MyButton(
                  buttonText: buttons[index],
                  buttontapped: () {
                    setState(() {
                      if (userInput.isNotEmpty) {
                        userInput =
                            userInput.substring(0, userInput.length - 1);
                        widget.onUserInput(userInput);
                      }
                    });
                  },
                );
              }
              // Logic for other buttons
              else {
                return MyButton(
                  buttonText: buttons[index],
                  buttontapped: () {
                    setState(() {
                      userInput += buttons[index];
                      widget.onUserInput(userInput);
                    });
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
