import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  get homePage => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}
