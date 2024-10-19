import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String data;
  final double size;
  final Color color;
  const CustomText({
    super.key,
    required this.data,
    required this.size,
    this.color = Colors.white,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.breeSerif(
        color: color,
        fontSize: size,
      ),
    );
  }
}
