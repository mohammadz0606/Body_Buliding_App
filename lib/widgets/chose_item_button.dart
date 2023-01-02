import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../helper/constant_style.dart';
import '../services/provider/app_provider.dart';

class ChoseItemButton extends StatelessWidget {
  const ChoseItemButton(
      {Key? key,
      required this.label,
      required this.index,
      required this.imageUrl,
      required this.visible,
      required this.type})
      : super(key: key);
  final String label;
  final int index;
  final bool visible;
  final String imageUrl;
  final int type;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, model, child) {
        return Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 4, 0, visible == true ? 0 : 4),
              color: MyColors.secondaryColor,
              child: CheckboxListTile(
                activeColor: Colors.red,
                value: model.typeCat == 0
                    ? model.carbItems[index]['value'] == 0
                        ? false
                        : true
                    : model.typeCat == 1
                        ? model.fatsItems[index]['value'] == 0
                            ? false
                            : true
                        : model.proteinsItems[index]['value'] == 0
                            ? false
                            : true,
                onChanged: (value) {
                  model.choseStarchesItem(value ?? false, index, context);
                },
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 5, 20, 0),
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
              ),
            ),
            Visibility(
              visible: visible,
              child: AnimatedContainer(
                color: MyColors.secondaryColor,
                width: double.infinity,
                duration: (Duration(seconds: 1)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: type == 1
                      ? [
                          RadioListTile<int>(
                              activeColor: Colors.red,
                              title: Text(
                                '${model.carbItems[index]['quantity'] * 1}G',
                                style: TextStyle(color: Colors.white),
                              ),
                              value: 1,
                              groupValue: model.carbItems[index]['groupValue'],
                              onChanged: (int? val) {
                                model.changeCount(val!, type, index);
                              }),
                          RadioListTile<int>(
                              activeColor: Colors.red,
                              title: Text(
                                '${model.carbItems[index]['quantity'] * 2}G',
                                style: TextStyle(color: Colors.white),
                              ),
                              value: 2,
                              groupValue: model.carbItems[index]['groupValue'],
                              onChanged: (int? val) {
                                model.changeCount(val!, type, index);
                              }),
                          RadioListTile<int>(
                              activeColor: Colors.red,
                              title: Text(
                                '${model.carbItems[index]['quantity'] * 3}G',
                                style: TextStyle(color: Colors.white),
                              ),
                              value: 3,
                              groupValue: model.carbItems[index]['groupValue'],
                              onChanged: (int? val) {
                                model.changeCount(val!, type, index);
                              })
                        ]
                      : type == 2
                          ? [
                              RadioListTile<int>(
                                activeColor: Colors.red,
                                title: Text(
                                  '${model.carbItems[index]['quantity'] * 1}G',
                                  style: TextStyle(color: Colors.white),
                                ),
                                value: 1,
                                groupValue: model.fatsItems[index]
                                    ['groupValue'],
                                onChanged: (int? val) {
                                  model.changeCount(val!, type, index);
                                },
                              ),
                              RadioListTile<int>(
                                activeColor: Colors.red,
                                title: Text(
                                  '${model.carbItems[index]['quantity'] * 2}G',
                                  style: TextStyle(color: Colors.white),
                                ),
                                value: 2,
                                groupValue: model.fatsItems[index]
                                    ['groupValue'],
                                onChanged: (int? val) {
                                  model.changeCount(val!, type, index);
                                },
                              ),
                              RadioListTile<int>(
                                activeColor: Colors.red,
                                title: Text(
                                  '${model.carbItems[index]['quantity'] * 3}G',
                                  style: TextStyle(color: Colors.white),
                                ),
                                value: 3,
                                groupValue: model.fatsItems[index]
                                    ['groupValue'],
                                onChanged: (int? val) {
                                  model.changeCount(val!, type, index);
                                },
                              )
                            ]
                          : [
                              RadioListTile<int>(
                                  activeColor: Colors.red,
                                  title: Text(
                                    '${model.carbItems[index]['quantity'] * 1}G',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  value: 1,
                                  groupValue: model.proteinsItems[index]
                                      ['groupValue'],
                                  onChanged: (int? val) {
                                    model.changeCount(val!, type, index);
                                  }),
                              RadioListTile<int>(
                                  activeColor: Colors.red,
                                  title: Text(
                                    '${model.carbItems[index]['quantity'] * 2}G',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  value: 2,
                                  groupValue: model.proteinsItems[index]
                                      ['groupValue'],
                                  onChanged: (int? val) {
                                    model.changeCount(val!, type, index);
                                  }),
                              RadioListTile<int>(
                                  activeColor: Colors.red,
                                  title: Text(
                                    '${model.carbItems[index]['quantity'] * 3}G',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  value: 3,
                                  groupValue: model.proteinsItems[index]
                                      ['groupValue'],
                                  onChanged: (int? val) {
                                    model.changeCount(val!, type, index);
                                  })
                            ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
