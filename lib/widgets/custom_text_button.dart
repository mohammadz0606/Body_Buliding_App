import 'package:flutter/material.dart';

class BulidTextButton extends StatelessWidget {
  const BulidTextButton({
    Key? key,
    required this.onPressd,
    required this.text,
  }) : super(key: key);
  final VoidCallback? onPressd;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressd,
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
