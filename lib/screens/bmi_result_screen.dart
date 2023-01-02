import 'package:google_fonts/google_fonts.dart';
import '/helper/constant_style.dart';
import '/services/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:percent_indicator/percent_indicator.dart';

class BMIResultScreen extends StatelessWidget {
  static const String route = "result_screen";

  const BMIResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Schedule'.toUpperCase()),
      ),
      body: Consumer<AppProvider>(
        builder: (context, model, child) {
          var resuelt = model.resueltOfSheduleModel!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: MyColors.secondaryColor,
                  selectedTextColor: Colors.white,
                  dateTextStyle: TextStyle(color: Colors.white, fontSize: 17),
                  dayTextStyle: TextStyle(color: Colors.white, fontSize: 11),
                  monthTextStyle: TextStyle(color: Colors.white, fontSize: 11),
                  daysCount: 15,
                ),
                SizedBox(height: size.height * 0.05),
                Row(
                  children: [
                    buildExpanded(
                      resuelt: Text(
                        resuelt.muscular,
                        style: GoogleFonts.lato(
                          fontSize: 15.1,
                          color: Colors.white,
                        ),
                      ),
                      icon: Icons.sports_gymnastics,
                    ),
                    buildExpanded(
                      resuelt: Text(
                        "${resuelt.calories.toString()}\nCalories",
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      icon: Icons.calculate_rounded,
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildCircularPercentIndicator(
                            color: Colors.red,
                            number: resuelt.proteinPercentage.round(),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Text(
                            "Protein\nPercentage",
                            style: GoogleFonts.lato(
                              fontSize: 17,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildCircularPercentIndicator(
                            color: Colors.green,
                            number: resuelt.carbPercentage.round(),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Text(
                            "Carb\nPercentage",
                            style: GoogleFonts.lato(
                              fontSize: 17,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildCircularPercentIndicator(
                            color: Colors.yellowAccent,
                            number: resuelt.fatPercentage.round(),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Text(
                            "Fat\nPercentage",
                            style: GoogleFonts.lato(
                              fontSize: 17,
                              color: Colors.yellowAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  CircularPercentIndicator buildCircularPercentIndicator({
    required Color color,
    required int number,
  }) {
    return CircularPercentIndicator(
      radius: 45,
      lineWidth: 8.0,
      animation: true,
      animationDuration: 700,
      percent: 0.5,
      center: new Text(
        number.toString(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
          color: Colors.white,
        ),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: color,
    );
  }

  Expanded buildExpanded({
    required Text resuelt,
    required IconData icon,
  }) {
    return Expanded(
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
          size: 25,
        ),
        title: resuelt,
      ),
    );
  }
}
