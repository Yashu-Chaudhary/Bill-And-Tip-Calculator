import 'package:bill_calculator/home_page.dart';
import 'package:bill_calculator/style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "BILL AND TIP CALCULATOR",
            style: Style.hedingText1,
          ),
          backgroundColor: Colors.blue,
        ),
        body: const HomePage(),
      ),
    );
  }
}
