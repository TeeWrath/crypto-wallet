import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.fromLTRB(15,0,15,0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                // padding: const EdgeInsets.only(left: 12, right: 12),
                width: double.infinity,
                height: 120,
                child: Card(
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text('Total Balance')),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '\$10.00',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            )),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.blue),
                    child: const Text('Send', style: TextStyle(fontSize: 18,color: Colors.white),),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
