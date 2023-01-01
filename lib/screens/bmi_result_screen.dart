import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget {
  static const String route = "result_screen";

  const BMIResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Schedule'.toUpperCase()),
      ),
      body: Center(
        child: Text("Mohammad Task"),
      ),
    );
  }
}
