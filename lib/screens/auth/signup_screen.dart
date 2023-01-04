import 'package:body_building/services/provider/app_provider.dart';
import 'package:body_building/widgets/background_image_widget.dart';
import 'package:body_building/widgets/title_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../helper/constant_style.dart';
import '../../helper/constant_widget.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_button.dart';
import '../../widgets/custom_text_filed.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);
  static const String route = "signup_screen";

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final FocusNode _focusNodeEmail = FocusNode();

  final FocusNode _focusNodePassword = FocusNode();

  final FocusNode _focusNodeName = FocusNode();

  final FocusNode _focusNodeConfirmPassword = FocusNode();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
    _focusNodeConfirmPassword.dispose();
    _focusNodeName.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var provider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.46),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          flexibleSpace: BulidBacgroundImage(
            size: size,
            suptitle: "Train and live new experience of\nexercising at home",
            title: "Sign Up",
            image: "assets/signup_image.png",
          ),
        ),
      ),
      backgroundColor: MyColors.thridColor,
      extendBodyBehindAppBar: true,
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.55),
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
                      focusNode: _focusNodeName,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(_focusNodeEmail);
                      },
                      controller: _nameController,
                      validator: (String? text) {
                        if (text!.isEmpty) {
                          return "you must not empty";
                        }
                        if (text.length > 16) {
                          return "name must be lees 16 char";
                        }
                        if (text.length < 3) {
                          return "is not name";
                        }
                        return null;
                      },
                      prefixIcon: Icons.person_outline,
                      hintText: "Enter your name",
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 15),
                    const TitleFields(text: "Email"),
                    CustomTextField(
                      controller: _emailController,
                      focusNode: _focusNodeEmail,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(_focusNodePassword);
                      },
                      textInputAction: TextInputAction.next,
                      validator: (String? text) {
                        if (text!.isEmpty) {
                          return "you must not empty";
                        }
                        /*
                        !text.contains("gmail.com") ||
                            !text.contains("yahoo.com")
                         */
                        if (!text.contains("@")) {
                          return "The email is incorrect";
                        }
                        return null;
                      },
                      prefixIcon: Icons.email_outlined,
                      hintText: "Enter your email",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 15),
                    const TitleFields(text: "Password"),
                    CustomTextField(
                      controller: _passwordController,
                      focusNode: _focusNodePassword,
                      onEditingComplete: () {
                        FocusScope.of(context)
                            .requestFocus(_focusNodeConfirmPassword);
                      },
                      textInputAction: TextInputAction.next,
                      validator: (String? text) {
                        if (text!.isEmpty) {
                          return "you must not empty";
                        }
                        if (text.length < 7) {
                          return "password must be more 7 char";
                        }
                        return null;
                      },
                      prefixIcon: Icons.lock_outline,
                      hintText: "Enter your password",
                      obscureText: provider.obscureTextSignUp,
                      suffixIcon: IconButton(
                        onPressed: () {
                          provider.changeVisibilitySignUp();
                        },
                        color: MyColors.titleFieldsColor,
                        icon: Icon(provider.iconSignUp),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: 15),
                    const TitleFields(text: "Confirm Password"),
                    CustomTextField(
                      controller: _confirmPasswordController,
                      focusNode: _focusNodeConfirmPassword,
                      textInputAction: TextInputAction.done,
                      onEditingComplete: () {
                        FocusScope.of(context).unfocus();
                      },
                      validator: (String? text) {
                        if (text!.isEmpty) {
                          return "you must not empty";
                        }
                        if (text.trim() != _passwordController.text.trim()) {
                          return "Password does not match";
                        }
                        return null;
                      },
                      prefixIcon: Icons.lock_outline,
                      hintText: "Confirm your password",
                      obscureText: provider.obscureTextSignUpCon,
                      suffixIcon: IconButton(
                        onPressed: (){
                          provider.changeVisibilitySignUpCon();
                        },
                        color: MyColors.titleFieldsColor,
                        icon: Icon(provider.iconSignUpCon),
                      ),
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
                    Consumer<AppProvider>(
                      builder: (context, model, child) {
                        return Visibility(
                          visible: !model.isLoading,
                          replacement:
                              ConstantWidget.circularProgressIndicator(),
                          child: Column(
                            children: [
                              Center(
                                child: CustomButton(
                                  onTap: () {
                                    if (_key.currentState!.validate()) {
                                      FocusScope.of(context).unfocus();
                                      model.signupApp(
                                        email: _emailController.text.trim(),
                                        password:
                                            _passwordController.text.trim(),
                                        name: _nameController.text.trim(),
                                        context: context,
                                      );
                                    }
                                  },
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
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
