import 'package:flutter/material.dart';
import 'package:wlt/utils.dart';

// creating Stateless Widget for buttons
class MyButton extends StatelessWidget {
const MyButton({super.key,required this.buttonText, required this.buttontapped});

final String buttonText;
final Function() buttontapped;

@override
Widget build(BuildContext context) {
	return GestureDetector(
	onTap: buttontapped,
	child: ClipRRect(
		child: Container(
			color: textFieldFillColor,
			child: Center(
			child: Text(
				buttonText,
				style: const TextStyle(
				color: primaryTextColor,
				fontSize: 25,
				fontWeight: FontWeight.bold,
				),
			),
			),
		),
		),
	);
}
}
