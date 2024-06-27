import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wlt/controller/auth_controller.dart';
import 'package:wlt/controller/wallet_controller.dart';
import 'package:wlt/utils.dart';
import 'package:wlt/view/airdrop.dart';
import 'package:wlt/view/balance_transfer.dart';
import 'package:wlt/view/create_wallet.dart';
import 'package:wlt/widgets/progress_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _balance; // To fetch and store balance in user account
  bool _isLoading = true; // To manage load state
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchBalance();
  }

  Future<void> _fetchBalance() async {
    final auth = Provider.of<AuthController>(context, listen: false);
    final wallet = Provider.of<WalletController>(context, listen: false);

    try {
      final balance = await wallet.getWalletBalance(
        walletAddress: wallet.publicKey,
        // walletAddress: 'CgkPHJSpAQ52CRKPZrd5SH5yNTnEeSBTCCVMqQ7ZjaeS',
        token: auth.getFlicToken,
      );
      setState(() {
        _balance = balance;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthController>(context);

    // If user does not have wallet, redirect to create wallet screen
    if (!auth.hasWallet) {
      return const CreateWalletScreen();
    }
    // otherwise show load state
    if (_isLoading) {
      return const ProgressIndicatorCustom(h: 200, w: 200);
    }
    // to deal with error
    if (_errorMessage != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Wallet',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: Center(child: Text('Error: $_errorMessage')),
      );
    }
    // home screen UI
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wallet',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 120,
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Text('Total Balance')),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '\$$_balance',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const BalanceTransferScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.blue,
                          overlayColor: secondaryColor,
                          maximumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text(
                          'Send',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context, MaterialPageRoute(builder: (ctx)=> const AirdropScreen())
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          maximumSize: const Size(double.infinity, 50),
                          backgroundColor: Colors.red,
                        ),
                        child: const Text(
                          'Airdrop',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
