import 'package:flutter/material.dart';

import '../helper/constant_style.dart';

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
