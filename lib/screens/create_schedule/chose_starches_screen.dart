import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helper/constant_style.dart';
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
                          physics: const BouncingScrollPhysics(),
                          itemCount: model.carbItems.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (index != model.carbItems.length - 1) {
                              return ChoseItemButton(
                                  type: 1,
                                  visible: model.carbItems[index]['visible'],
                                  imageUrl: model.carbItems[index]['imageUrl'],
                                  label: model.carbItems[index]['name'],
                                  index: index);
                            } else {
                              return Column(
                                children: [
                                  ChoseItemButton(
                                      type: 1,
                                      visible: model.carbItems[index]
                                          ['visible'],
                                      imageUrl: model.carbItems[index]
                                          ['imageUrl'],
                                      label: model.carbItems[index]['name'],
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
                              physics: const BouncingScrollPhysics(),
                              itemCount: model.fatsItems.length,
                              itemBuilder: (BuildContext context, int index) {
                                if (index != model.fatsItems.length - 1) {
                                  return ChoseItemButton(
                                      type: 2,
                                      imageUrl: model.fatsItems[index]
                                          ['imageUrl'],
                                      label: model.fatsItems[index]['name'],
                                      index: index,
                                      visible: model.fatsItems[index]
                                          ['visible']);
                                } else {
                                  return Column(
                                    children: [
                                      ChoseItemButton(
                                          type: 2,
                                          visible: model.fatsItems[index]
                                              ['visible'],
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
                              physics: const BouncingScrollPhysics(),
                              itemCount: model.proteinsItems.length - 2,
                              itemBuilder: (BuildContext context, int index) {
                                if (index != model.proteinsItems.length - 3) {
                                  return ChoseItemButton(
                                      type: 3,
                                      visible: model.proteinsItems[index]
                                          ['visible'],
                                      imageUrl: model.proteinsItems[index]
                                          ['imageUrl'],
                                      label: model.proteinsItems[index]['name'],
                                      index: index);
                                } else {
                                  return Column(
                                    children: [
                                      ChoseItemButton(
                                          type: 3,
                                          visible: model.proteinsItems[index]
                                              ['visible'],
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
                                model.typeCat == 0
                                    ? model.carbPercentage == null
                                        ? model.resueltOfSheduleModel!
                                            .carbPercentage
                                            .round()
                                            .toString()
                                        : model.carbPercentage!
                                            .round()
                                            .toString()
                                    : model.typeCat == 1
                                        ? model.fatPercentage == null
                                            ? model.resueltOfSheduleModel!
                                                .fatPercentage
                                                .round()
                                                .toString()
                                            : model.fatPercentage!
                                                .round()
                                                .toString()
                                        : model.proteinPercentage == null
                                            ? model.resueltOfSheduleModel!
                                                .proteinPercentage
                                                .round()
                                                .toString()
                                            : model.proteinPercentage!
                                                .round()
                                                .toString(),
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                ' calories ',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
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
                                  if (model.typeCat == 1) {
                                    model.cancelCarbMeals(context);
                                  } else if (model.typeCat == 2) {
                                    model.cancelProteinMeals(context);
                                  } else {
                                    model.cancelFatMeals(context);
                                  }

                                  Navigator.of(context).pop();
                                },
                                backgroundColor: MyColors.secondaryColor,
                                labelColor: Colors.red,
                              ),
                              SubmitItemButton(
                                size: size,
                                label: 'Apply',
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
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
