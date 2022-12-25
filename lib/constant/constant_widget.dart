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

  static void dialog({
    required BuildContext context,
    required Widget title,
    required Widget content,
    List<Widget>? action,
    Color? color

  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(backgroundColor: color??Colors.white,
          actions: action??[],
          title: title,
          content: content,
        );
      },
    );
  }
}
