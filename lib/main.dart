import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt/controller/auth_controller.dart';
import 'package:wlt/controller/wallet_controller.dart';
import 'package:wlt/view/create_wallet.dart';
import 'package:wlt/view/enter_wallet_details.dart';
import 'package:wlt/view/home_view.dart';
import 'package:wlt/view/login_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => AuthController()),
      ChangeNotifierProvider(create: (context) => WalletController())
    ], child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CreateWalletScreen(),
    ),);
  }
}

