import 'package:flutter/material.dart';
class Bgradient extends StatelessWidget {
  const Bgradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
              Color(0xff1f005c),
              Color(0xffffb56b),
            ],
          begin: Alignment.topLeft,
        end: Alignment.bottomRight),
        color: Colors.amber));
  }
}