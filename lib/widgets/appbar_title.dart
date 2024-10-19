import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class _AppBarTitle extends StatelessWidget {
  final String data;
  final double size;
  final Color color;

  const _AppBarTitle({
    required this.data,
    required this.size,
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.breeSerif(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      textBaseline: TextBaseline.ideographic,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _AppBarTitle(data: "F", size: 45, color: Colors.blue),
        _AppBarTitle(data: "L", size: 40, color: Colors.blue),
        _AppBarTitle(data: "U", size: 36, color: Colors.blue),
        _AppBarTitle(data: "T", size: 33, color: Colors.blue),
        _AppBarTitle(data: "T", size: 31, color: Colors.blue),
        _AppBarTitle(data: "E", size: 30, color: Colors.blue),
        _AppBarTitle(data: "R", size: 31, color: Colors.blue),
        _AppBarTitle(data: "F", size: 33, color: Colors.red),
        _AppBarTitle(data: "L", size: 36, color: Colors.red),
        _AppBarTitle(data: "I", size: 40, color: Colors.red),
        _AppBarTitle(data: "X", size: 45, color: Colors.red),
      ],
    );
  }
}
