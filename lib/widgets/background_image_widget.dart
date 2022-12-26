import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helper/constant_style.dart';


class BulidBacgroundImage extends StatelessWidget {
  const BulidBacgroundImage({
    Key? key,
    required this.size,
    required this.suptitle,
    required this.title,
    required this.image,
  }) : super(key: key);

  final Size size;
  final String suptitle;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: size.height * 0.55,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(image),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          height: size.height * 0.55,
          width: size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                MyColors.thridColor,
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.03),
              RichText(
                text: TextSpan(
                  text: "body\t",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 30,
                    letterSpacing: 5,
                  ),
                  children: const [
                    TextSpan(
                      text: "Building\t",
                      style: TextStyle(
                        color: MyColors.firstColor,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Text(
                      suptitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.8,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
