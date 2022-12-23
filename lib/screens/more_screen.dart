import 'package:flutter/material.dart';

class MoreAppScreen extends StatelessWidget {
  const MoreAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
