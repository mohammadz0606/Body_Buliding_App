import 'package:body_building/constant/constant_style.dart';
import 'package:flutter/material.dart';

import '../../widgets/background_image_widget.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_filed.dart';
import '../../widgets/title_fields.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String route = "login_screen";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BulidBacgroundImage(
              size: size,
              title: "Sign in",
              suptitle: "Train and live new experience of\nexercising at home",
              image: "assets/login_image.jpg",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleFields(text: "Email"),
                  CustomTextField(
                    prefixIcon: Icons.email_outlined,
                    hintText: "Enter your email",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 15),
                  const TitleFields(text: "Password"),
                  CustomTextField(
                    obscureText: true,
                    prefixIcon: Icons.lock_outline,
                    hintText: "Enter your password",
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: size.height * 0.039),
                  Center(
                    child: CustomButton(
                      onTap: () {},
                      text: "Login",
                      size: size,
                      boxDecoration: BoxDecoration(
                        color: MyColors.firstColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.5),
                  Center(
                    child: CustomButton(
                      onTap: () {
                        Navigator.of(context).pushNamed(SignupScreen.route);
                      },
                      text: "Sign Up",
                      size: size,
                      boxDecoration: BoxDecoration(
                        color: MyColors.thridColor,
                        border: Border.all(
                          width: 2,
                          color: MyColors.firstColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
