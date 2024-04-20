import 'package:flutter/material.dart';
import 'package:flutter_application_1/errorscreen.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
           debugShowCheckedModeBanner: false,
      home: const Home(),
      
      initialRoute: '/loading',
      routes: {
        // '/': (context) => const Loading(),
        '/home': (context) => const Home(),
        '/loading': (context) => const Loading(),
        '/error': (context) => const ErrorScreen(),
      },
    );
  }
}
