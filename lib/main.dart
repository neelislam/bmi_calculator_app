import 'package:flutter/material.dart';
import 'bmiCalculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const bmi_calc(),
    );
  }
}
