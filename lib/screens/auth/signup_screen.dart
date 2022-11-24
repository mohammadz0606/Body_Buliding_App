import 'package:body_building/widgets/background_image_widget.dart';
import 'package:body_building/widgets/title_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/constant_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_button.dart';
import '../../widgets/custom_text_filed.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);
  static const String route = "signup_screen";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BulidBacgroundImage(
              size: size,
              suptitle: "Train and live new experience of\nexercising at home",
              title: "Sign Up",
              image: "assets/signup_image.png",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleFields(text: "Name"),
                  CustomTextField(
                    prefixIcon: Icons.person_outline,
                    hintText: "Enter your name",
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 15),
                  const TitleFields(text: "Email"),
                  CustomTextField(
                    prefixIcon: Icons.email_outlined,
                    hintText: "Enter your email",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 15),
                  const TitleFields(text: "Password"),
                  CustomTextField(
                    prefixIcon: Icons.lock_outline,
                    hintText: "Enter your password",
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: size.height * 0.042),
                  const Text(
                    "By Signing up, I agree to the sport workout User\nAgreement and Privacy Policy",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.8,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Center(
                    child: CustomButton(
                      onTap: () {},
                      text: "Register",
                      size: size,
                      boxDecoration: BoxDecoration(
                        color: MyColors.firstColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: GoogleFonts.lato(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      BulidTextButton(
                        onPressd: () {
                          Navigator.of(context).pop();
                        },
                        text: "Login",
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
