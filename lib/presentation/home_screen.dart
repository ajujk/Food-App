import 'package:flutter/material.dart';
import 'package:food_app/presentation/qr_code_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Turbolab"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => QRViewExample()));
            },
            child: const Text("Open Scanner")),
      ),
    );
  }
}
