import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../constant/constant_style.dart';
import '../services/provider/app_provider.dart';

class ChoseItemButton extends StatelessWidget {
  const ChoseItemButton({
    Key? key,
    required this.label,
    required this.index, required this.imageUrl,
  }) : super(key: key);
  final String label;
  final int index;
final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, model, child) {
      return Container(
          margin: EdgeInsets.symmetric(vertical: 4),
          color: MyColors.secondaryColor,
          child: CheckboxListTile(
            activeColor: Colors.red,
            value: model.typeCat == 0
                ? model.starchesItems[index]['value']
                : model.typeCat == 1
                    ? model.fatsItems[index]['value']
                    : model.proteinsItems[index]['value'],
            onChanged: (value) {
              model.choseStarchesItem(value ?? false, index);
            },
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(padding: EdgeInsets.fromLTRB(0,5,20,0),
                  height: 100,
                  width: 100,
                  child: ClipRRect(
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  label,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ));
    });
  }
}
