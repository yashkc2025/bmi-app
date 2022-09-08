import 'package:flutter/material.dart';

void main() {
  runApp(const Bmi());
}

class Bmi extends StatefulWidget {
  const Bmi({super.key});

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child : Scaffold(
          
        )
      )
    )
  }
}