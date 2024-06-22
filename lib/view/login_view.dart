import 'package:flutter/material.dart';
import 'package:wlt/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _mixedController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _mixedController.dispose();
    _passwordController.dispose();
  }

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
                Image.asset('assets/solanaLogoMark.png'),
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: _mixedController,
                  style: const TextStyle(color: primaryTextColor),
                  decoration: const InputDecoration(
                    hintText: 'Username / Email',
                    hintStyle: TextStyle(fontSize: 14, color: primaryTextColor),
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
                TextField(
                  controller: _passwordController,
                  style: const TextStyle(color: primaryTextColor),
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(fontSize: 14, color: primaryTextColor),
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
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text('Login',style: TextStyle(color: Colors.black),)),
                const SizedBox(height: 50,),
                const Divider(
                  color: Colors.white,
                  thickness: 0.5,
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?', style: TextStyle(color: primaryTextColor),),
                    TextButton(onPressed: () {},child: const Text('Sign Up', style: TextStyle(color: secondaryColor),),),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
