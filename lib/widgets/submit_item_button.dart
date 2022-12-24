import 'package:flutter/material.dart';
class SubmitItemButton extends StatelessWidget {
  const SubmitItemButton({
    Key? key,
    required this.size,
    required this.label,
    required this.onTap,
    required this.backgroundColor,
    required this.labelColor,
  }) : super(key: key);
  final String label;
  final VoidCallback onTap;
  final Size size;
  final Color backgroundColor;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: size.width * 0.4,
        height: size.height * 0.075,
        child: Text(
          label,
          style: TextStyle(
              color: labelColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        decoration: BoxDecoration(
            border: Border.all(width: 3, color: Colors.red),
            color: backgroundColor,
            borderRadius: BorderRadius.circular(40)),
      ),
    );
  }
}
