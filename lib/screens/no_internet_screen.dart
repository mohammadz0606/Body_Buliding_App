import 'package:google_fonts/google_fonts.dart';

import '/widgets/title_app.dart';
import 'package:flutter/material.dart';

class NoInterNetScreen extends StatelessWidget {
  const NoInterNetScreen({Key? key}) : super(key: key);
  static const String route = "no_internet_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TitleApp(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
             Text(
              "Can't connect..check Internet 😢",
              style: GoogleFonts.lato(
                fontSize: 22.5,
                color: Colors.white,
              )
            ),
            const SizedBox(height: 25),
            Image.asset(
              "assets/no internet.jpg",
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
