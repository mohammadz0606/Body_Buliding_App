import 'package:flutter/material.dart';

class ConstantWidget {
  static Widget circularProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }

  static void massage({
    required BuildContext context,
    required String text,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        dismissDirection: DismissDirection.endToStart,
      ),
    );
  }
}
