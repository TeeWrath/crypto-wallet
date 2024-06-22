import 'package:flutter/material.dart';
import 'package:wlt/utils.dart';

class ProgressIndicatorCustom extends StatelessWidget {
  const ProgressIndicatorCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            // you can replace this with Image.asset
            'assets/solanaLogoMark.png',
            fit: BoxFit.cover,
            height: 20,
            width: 20,
          ),
          // you can replace
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(secondaryColor),
            strokeWidth: 3,
          ),
        ],
      ),
    );
  }
}
