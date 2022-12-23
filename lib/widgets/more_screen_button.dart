import 'package:flutter/material.dart';
class MoreScreenButton extends StatelessWidget {
  const MoreScreenButton({
    Key? key, required this.color, required this.label, required this.icon, required this.onTap,
  }) : super(key: key);
  final Color color;
  final String label;
  final IconData icon;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return ListTile(trailing: Icon(Icons.arrow_forward_ios,color: color,),
      title:
      Text(label.toString(), style: TextStyle(color: color)),
      leading: Icon(
        icon,
        color: color,
      ),
      onTap: onTap,
    );
  }
}
