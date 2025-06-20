import 'package:calculator_app/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}


class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}

