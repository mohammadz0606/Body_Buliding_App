import 'package:body_building/constant/constant_style.dart';
import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget {
  const BMIResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: MyColors.primaryColor,
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: const Text('BMI RESULT'),
        centerTitle: true,
        elevation: 20,

      ),body: Container(),
    );
  }
}
