import 'package:flutter/material.dart';
import 'package:mini_calculator_app/views/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      debugShowCheckedModeBanner: false,
      home: const HomeViews(),
      theme: ThemeData.dark(),
    );
  }
}
