import 'package:body_building/constant/constant_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/provider/app_provider.dart';
import '../../widgets/chose_item_button.dart';
import '../../widgets/submit_item_button.dart';

class ChoseStarchesScreen extends StatelessWidget {
  const ChoseStarchesScreen({Key? key}) : super(key: key);
  static const String route = 'chose_starches';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Chose item'),
        ),
        body: Consumer<AppProvider>(
          builder: (context, model, child) {
            return Stack(
              children: [
                Container(
                  child: model.typeCat == 0
                      ? ListView.builder(
                          itemCount: model.starchesItems.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (index != model.starchesItems.length - 1) {
                              return ChoseItemButton(
                                  imageUrl: model.starchesItems[index]
                                      ['imageUrl'],
                                  label: model.starchesItems[index]['name'],
                                  index: index);
                            } else {
                              return Column(
                                children: [
                                  ChoseItemButton(
                                      imageUrl: model.starchesItems[index]
                                          ['imageUrl'],
                                      label: model.starchesItems[index]['name'],
                                      index: index),
                                  SizedBox(
                                    height: 160,
                                  )
                                ],
                              );
                            }
                          },
                        )
                      : model.typeCat == 1
                          ? ListView.builder(
                              itemCount: model.fatsItems.length,
                              itemBuilder: (BuildContext context, int index) {
                                if (index != model.fatsItems.length - 1) {
                                  return ChoseItemButton(
                                      imageUrl: model.fatsItems[index]
                                          ['imageUrl'],
                                      label: model.fatsItems[index]['name'],
                                      index: index);
                                } else {
                                  return Column(
                                    children: [
                                      ChoseItemButton(
                                          imageUrl: model.fatsItems[index]
                                              ['imageUrl'],
                                          label: model.fatsItems[index]['name'],
                                          index: index),
                                      SizedBox(
                                        height: 160,
                                      )
                                    ],
                                  );
                                }
                              },
                            )
                          : ListView.builder(
                              itemCount: model.proteinsItems.length,
                              itemBuilder: (BuildContext context, int index) {
                                if (index != model.proteinsItems.length - 1) {
                                  return ChoseItemButton(
                                      imageUrl: model.proteinsItems[index]
                                          ['imageUrl'],
                                      label: model.proteinsItems[index]['name'],
                                      index: index);
                                } else {
                                  return Column(
                                    children: [
                                      ChoseItemButton(
                                          imageUrl: model.proteinsItems[index]
                                              ['imageUrl'],
                                          label: model.proteinsItems[index]
                                              ['name'],
                                          index: index),
                                      SizedBox(
                                        height: 160,
                                      )
                                    ],
                                  );
                                }
                              },
                            ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: MyColors.secondaryColor,
                      ),
                      width: size.width,
                      height: size.height * 0.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'You have ',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                              Text(
                                model.calories.toString(),
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                ' calories ',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SubmitItemButton(
                                size: size,
                                label: 'Discard',
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                backgroundColor: MyColors.secondaryColor,
                                labelColor: Colors.red,
                              ),
                              SubmitItemButton(
                                size: size,
                                label: 'Apply',
                                onTap: () {},
                                backgroundColor: Colors.red,
                                labelColor: Colors.white,
                              )
                            ],
                          ),
                        ],
                      )),
                )
              ],
            );
          },
        ));
  }
}