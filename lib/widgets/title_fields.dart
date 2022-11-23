import 'package:body_building/constant/constant_style.dart';
import 'package:flutter/material.dart';

class TitleFields extends StatelessWidget {
  final String text;
  const TitleFields({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: MyColors.titleFieldsColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
