import 'package:body_building/helper/constant_widget.dart';
import 'package:body_building/screens/create_schedule/chose_category.dart';
import 'package:body_building/screens/nav_screen.dart';
import 'package:body_building/services/models/resuelt_of_schedule_model.dart';
import 'package:body_building/services/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../helper/constant_style.dart';
import '../widgets/submit_item_button.dart';

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({Key? key}) : super(key: key);
  static const String route = 'calculate_screen';

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(body: Consumer<AppProvider>(
      builder: (context, model, child) {
        return Stack(
          children: [
            Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Consumer<AppProvider>(builder: (context, model, child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            genderMethode(
                              size,
                              'MALE',
                              Icons.male,
                              true,
                              model.maleColor,
                            ),
                            genderMethode(
                              size,
                              'FEMALE',
                              Icons.female,
                              false,
                              model.femaleColor,
                            )
                          ],
                        );
                      }),
                      Container(
                          alignment: Alignment.center,
                          color: MyColors.secondaryColor,
                          margin: EdgeInsets.all(size.width * 0.04),
                          width: double.infinity,
                          height: size.height * 0.25,
                          child: Consumer<AppProvider>(
                            builder: (context, model, child) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                      0,
                                      size.height * 0.01,
                                      0,
                                      size.height * 0.03,
                                    ),
                                    child: Text(
                                      'HEIGHT',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: size.width * 0.05),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        model.height.round().toString(),
                                        style: TextStyle(
                                            fontSize: size.width * 0.1,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        ' cm',
                                        style: TextStyle(
                                            fontSize: size.width * 0.07,
                                            color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  Slider(
                                      thumbColor: Colors.red,
                                      inactiveColor: Colors.grey,
                                      activeColor: Colors.white,
                                      divisions: 250,
                                      max: 300,
                                      min: 50,
                                      value: model.height,
                                      onChanged: (val) {
                                        model.setHeight(val);
                                      }),
                                ],
                              );
                            },
                          )),
                      Container(
                        alignment: Alignment.center,
                        color: MyColors.secondaryColor,
                        margin: EdgeInsets.all(size.width * 0.04),
                        width: double.infinity,
                        height: size.height * 0.3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: TextStyle(
                                fontSize: size.width * 0.050,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              model.weight.toStringAsFixed(1).toString(),
                              style: TextStyle(
                                fontSize: size.width * 0.13,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    buildWeightButton(0.1, '+0.1', 45),
                                    buildWeightButton(5, '+5', 45),
                                  ],
                                ),
                                buildWeightButton(1, '+1', 65),
                                SizedBox(
                                  width: 50,
                                ),
                                buildWeightButton(-1, '-1', 65),
                                Column(
                                  children: [
                                    buildWeightButton(-0.1, '-0.1', 45),
                                    buildWeightButton(-5, '-5', 45),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          typeMethode(
                            size,
                            'drying of fat'.toUpperCase(),
                            Icons.sports_gymnastics_sharp,
                            model.dryingOfFatColor,
                            false,
                          ),
                          typeMethode(
                              size,
                              'muscular'.toUpperCase(),
                              Icons.sports_gymnastics_sharp,
                              model.muscularColor,
                              true)
                        ],
                      ),
                      Container(
                        alignment: Alignment.center,
                        color: MyColors.secondaryColor,
                        margin: EdgeInsets.all(size.width * 0.04),
                        width: double.infinity,
                        height: size.height * 0.4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ACTIVITY RATE DURING',
                              style: TextStyle(
                                fontSize: size.width * 0.050,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            costumeButton(
                              0,
                              "Don't do sport",
                              size,
                              model.numberOfDay[0]['submit'] == true
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                            costumeButton(
                              1,
                              "1 to 3 days per week",
                              size,
                              model.numberOfDay[1]['submit'] == true
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                            costumeButton(
                              2,
                              "4 to 5 days per week",
                              size,
                              model.numberOfDay[2]['submit'] == true
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                            costumeButton(
                              3,
                              "6 to 7 days per week",
                              size,
                              model.numberOfDay[3]['submit'] == true
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                            costumeButton(
                              4,
                              "6 to 7 days but twice a day",
                              size,
                              model.numberOfDay[4]['submit'] == true
                                  ? Colors.white
                                  : Colors.grey,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 140,
                      )
                    ],
                  ),
                )),
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
                            'Do you want to ',
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                          Text(
                            'Calculate ',
                            style: TextStyle(
                                fontSize: 21,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'your calories? ',
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          )
                        ],
                      ),
                      Visibility(
                        visible: !model.isLoadingCalories,
                        replacement: ConstantWidget.circularProgressIndicator(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SubmitItemButton(
                              size: size,
                              label: 'Discard',
                              onTap: () {
                                if (Navigator.of(context).canPop()) {
                                  Navigator.of(context).pop();
                                } else
                                  model.onTabChange(0);
                              },
                              backgroundColor: MyColors.secondaryColor,
                              labelColor: Colors.red,
                            ),
                            SubmitItemButton(
                              size: size,
                              label: 'Calculate',
                              onTap: () {
                                model.getResult(
                                  context,
                                );
                              },
                              backgroundColor: Colors.red,
                              labelColor: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        );
      },
    ));
  }

  InkWell costumeButton(
    int value,
    String title,
    Size size,
    Color color,
  ) {
    return InkWell(
      onTap: () {
        Provider.of<AppProvider>(context, listen: false).setNumberOfDay(value);
      },
      child: Container(
          color: const Color(0x353956FF),
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          height: size.height * 0.05,
          width: double.infinity,
          child: Text(
            title,
            style: TextStyle(
                fontSize: color == Colors.white
                    ? size.width * 0.06
                    : size.width * 0.05,
                color: color),
          )),
    );
  }

  SizedBox buildWeightButton(
    double inc,
    String text,
    double size,
  ) {
    return SizedBox(
      width: size,
      child: FloatingActionButton(
        heroTag: null,
        backgroundColor: const Color(0x353956FF),
        child: Text(text),
        onPressed: () {
          Provider.of<AppProvider>(context, listen: false).setWeight(inc);
        },
      ),
    );
  }

  InkWell typeMethode(
    Size size,
    String title,
    IconData icon,
    Color color,
    bool isMuscular,
  ) {
    return InkWell(
      onTap: () {
        Provider.of<AppProvider>(context, listen: false).setType(isMuscular);
      },
      child: Container(
        margin: EdgeInsets.all(size.width * 0.01),
        width: size.width * 0.4,
        height: size.height * 0.25,
        alignment: Alignment.center,
        color: MyColors.secondaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, size.height * 0.02),
              child: Icon(
                icon,
                size: size.width * 0.28,
                color: color,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: size.width * 0.05,
                color: color,
              ),
            )
          ],
        ),
      ),
    );
  }

  InkWell genderMethode(
    Size size,
    String title,
    IconData icon,
    bool isMale,
    Color color,
  ) {
    return InkWell(onTap: () {
      Provider.of<AppProvider>(context, listen: false).setGender(isMale);
    }, child: Consumer<AppProvider>(
      builder: (context, model, child) {
        return Container(
          margin: EdgeInsets.all(size.width * 0.01),
          width: size.width * 0.4,
          height: size.height * 0.2,
          alignment: Alignment.center,
          color: MyColors.secondaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, size.height * 0.02),
                child: Icon(
                  icon,
                  size: size.height * 0.134,
                  color: color,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: size.width * 0.05,
                  color: color,
                ),
              )
            ],
          ),
        );
      },
    ));
  }
}
