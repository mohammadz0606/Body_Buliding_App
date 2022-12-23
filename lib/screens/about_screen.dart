import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/constant_style.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);
  static const String route = "about_app_screen";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        title: Text("About App"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/about_app/full-shot-happy-fit-people-gym.jpg",
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Text(
                "The application aims to spread the idea of bodybuilding and living a healthy life free from diseases, as it provides the user with many options according to his goal, such as muscle mass or getting rid of fat, so that it provides the user with the nutritional schedule, exercise and appropriate calories for him according to his goal.",
                style: GoogleFonts.tenaliRamakrishna(
                  color: Colors.white,
                  fontSize: 19.5,
                ),
              ),
              const SizedBox(height: 20),
              buildTitle(
                text: "This app works on",
              ),
              buildListTile(
                text: "Decide to build muscle or loss fat",
              ),
              buildListTile(
                text: "Calculate Calories",
              ),
              buildListTile(
                text: "Providing free exercises techniques for everyone",
              ),
              const SizedBox(height: 25),
              buildTitle(
                text: "Objectives",
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildObjectiveText(
                    text:
                    "To spread awareness among people\nAbout the importance of healthy habits and sport in life",
                  ),
                  const SizedBox(width: 15),
                  buildObjectiveImage(size:size,image: "assets/about_app/obj01.jpg"),
                ],
              ),
              const SizedBox(height: 18.5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildObjectiveImage(size:size,image: "assets/about_app/objective02.jpg"),
                  const SizedBox(width: 15),
                  buildObjectiveText(
                    text:
                    "To emphasize impotence, Body Building\nTo be able to exercise at any time and in what condition",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildObjectiveImage({required Size size, required String image,}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.5,
          color: MyColors.primaryColor,
        ),
        borderRadius: BorderRadius.circular(17),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(17),
        child: Image.asset(
        image,
        fit: BoxFit.cover,
        height: size.height / 3.1,
        width: size.width / 2.55,
        ),
      ),
    );
  }

  Expanded buildObjectiveText({required String text}) {
    return Expanded(
      child: Text(
        text,
        style: GoogleFonts.lato(fontSize: 18, color: Colors.white, height: 1.4),
      ),
    );
  }

  Text buildTitle({
    required String text,
  }) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 23,
      ),
    );
  }

  ListTile buildListTile({
    required String text,
    String subText = "",
  }) {
    return ListTile(
      leading: Icon(
        Icons.star,
        color: Colors.yellow,
        size: 22,
      ),
      title: Text(
        text,
        style: GoogleFonts.lato(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
