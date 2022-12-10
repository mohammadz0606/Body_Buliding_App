import 'package:body_building/constant/constant_style.dart';
import 'package:body_building/constant/constant_widget.dart';
import 'package:body_building/services/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/background_image_widget.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_filed.dart';
import '../../widgets/title_fields.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const String route = "login_screen";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColors.thridColor,
      extendBodyBehindAppBar: true,
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BulidBacgroundImage(
                size: size,
                title: "Sign in",
                suptitle:
                    "Train and live new experience of\nexercising at home",
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
                      validator: (String? text) {
                        if (text!.isEmpty) {
                          return "you must not empty";
                        }
                        if (!text.contains("@")) {
                          return "The email is incorrect";
                        }
                        return null;
                      },
                      controller: _emailController,
                      prefixIcon: Icons.email_outlined,
                      hintText: "Enter your email",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 15),
                    const TitleFields(text: "Password"),
                    CustomTextField(
                      controller: _passwordController,
                      validator: (String? text) {
                        if (text!.isEmpty) {
                          return "you must not empty";
                        }
                        if (text.length < 7) {
                          return "password must be more 7 char";
                        }
                        return null;
                      },
                      obscureText: true,
                      prefixIcon: Icons.lock_outline,
                      hintText: "Enter your password",
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(height: size.height * 0.039),
                    Consumer<AppProvider>(
                      builder: (
                        BuildContext context,
                        AppProvider model,
                        Widget? child,
                      ) {
                        return model.isLoading
                            ? ConstantWidget.circularProgressIndicator()
                            : Center(
                                child: CustomButton(
                                  onTap: () {
                                    model.signInApp(
                                      context: context,
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text.trim(),
                                    );
                                  },
                                  text: "Login",
                                  size: size,
                                  boxDecoration: BoxDecoration(
                                    color: MyColors.firstColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              );
                      },
                    ),
                    const SizedBox(height: 12.5),
                    Center(
                      child: CustomButton(
                        onTap: () {
                          Navigator.of(context).pushNamed(SignupScreen.route);
                          FocusScope.of(context).unfocus();
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
      ),
    );
  }
}
