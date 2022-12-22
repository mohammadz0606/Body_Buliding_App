import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleApp extends StatelessWidget {
  const TitleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "BODY BUILDING",
      style: GoogleFonts.merriweather(
        fontSize: 22.5,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
