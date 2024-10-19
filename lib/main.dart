import 'package:flutter/material.dart';
import 'package:flutterflix/screens/home_screen.dart';

void main() {
  runApp(const FlutterFlix());
}

class FlutterFlix extends StatelessWidget {
  const FlutterFlix({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}
