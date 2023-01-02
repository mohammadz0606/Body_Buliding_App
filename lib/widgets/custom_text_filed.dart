import 'package:flutter/material.dart';

import '../helper/constant_style.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final IconData prefixIcon;
  IconButton? suffixIcon;
  final TextEditingController controller;
  final String? Function(String? value) validator;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final VoidCallback? onEditingComplete;
  bool? obscureText;

  CustomTextField({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    required this.prefixIcon,
    required this.controller,
    required this.validator,
    this.obscureText,
    this.focusNode,
    this.suffixIcon,
    this.textInputAction,
    this.onEditingComplete,
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
      focusNode: focusNode,
      textInputAction: textInputAction,
      onEditingComplete: onEditingComplete,
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
        suffixIcon: suffixIcon,
        prefixIcon: Icon(
          prefixIcon,
          color: MyColors.titleFieldsColor,
        ),
      ),
    );
  }
}
