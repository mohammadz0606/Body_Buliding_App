import 'package:body_building/screens/create_schedule/chose_starches_screen.dart';
import 'package:body_building/services/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helper/constant_style.dart';

class TypeFoodButton extends StatelessWidget {
  const TypeFoodButton({
    Key? key,
    required this.size,
    required this.label,
    required this.imageUrl,
    required this.type,
  }) : super(key: key);

  final Size size;
  final String label;
  final String imageUrl;
  final int type;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.9,
      margin: EdgeInsets.all(size.height * 0.03),
      height: size.height * 0.2,
      decoration: BoxDecoration(
        color: MyColors.secondaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () {
          Provider.of<AppProvider>(context, listen: false).choseCategory(type);

          Navigator.of(context).pushNamed(ChoseStarchesScreen.route);
        },
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
