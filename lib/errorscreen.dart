import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map? info = ModalRoute.of(context)?.settings.arguments as Map?;
    String tempValue = (info!['tempvalue'].toString());
    if (tempValue == 'N/A') {
      Navigator.pushNamed(context, '/error');
      print(tempValue);
    }
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(color: Colors.blue),
        child: const Text('Error'),
      ),
    );
  }
}
