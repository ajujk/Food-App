import 'package:confirmation_success/confirmation_success.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants/status.dart';
import 'package:food_app/presentation/qr_code_screen.dart';

class ResponseScreen extends StatelessWidget {
  const ResponseScreen({super.key, required this.responseStatus});
  final ResponseStatus responseStatus;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const QRViewExample(),
          ),
          (route) => false);
    });
    return Scaffold(
      body: ConfirmationSuccess(
        reactColor: responseStatus == ResponseStatus.internalError
            ? Colors.red
            : Colors.green,
        child: Text(
          responseStatus == ResponseStatus.internalError ? "ERROR" : "SUCCESS!",
          style: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
