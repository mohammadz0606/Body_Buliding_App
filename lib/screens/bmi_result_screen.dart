import 'package:body_building/constant/constant_style.dart';
import 'package:body_building/services/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BMIResultScreen extends StatelessWidget {
  static const String route = "result_screen";

  const BMIResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: const Text('BMI RESULT'),
        centerTitle: true,
        elevation: 20,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Weight: ${Provider.of<AppProvider>(context).weight.toStringAsFixed(1)}',
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
              ),
            ),
            Text(
              'Calories: ${Provider.of<AppProvider>(context).calories}',
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
              ),

            ), Text(
              'Best Weight: ${Provider.of<AppProvider>(context).bestWeight.toStringAsFixed(1)}',
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
              ),

            ), Text(
              'OverWeight: ${((Provider.of<AppProvider>(context).weight)-(Provider.of<AppProvider>(context).bestWeight)).toStringAsFixed(1)}',
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
              ),

            )

          ],
        ),
      ),
    );
  }
}
