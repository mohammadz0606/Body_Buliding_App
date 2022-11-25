// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../constant/constant_style.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final IconData prefixIcon;
  final TextEditingController controller;
  final String? Function(String? value) validator;
  bool? obscureText;
  CustomTextField({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    required this.prefixIcon,
    required this.controller,
    required this.validator,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: Colors.white,
      ),
      validator: validator,
      controller: controller,
      cursorColor: Colors.white,
      obscureText: obscureText == null ? false : obscureText!,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintTextDirection: TextDirection.ltr,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: MyColors.titleFieldsColor,
          fontSize: 15,
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: MyColors.titleFieldsColor,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: MyColors.titleFieldsColor,
          ),
        ),
        disabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: MyColors.titleFieldsColor,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: MyColors.titleFieldsColor,
          ),
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: MyColors.titleFieldsColor,
        ),
      ),
    );
  }
}
