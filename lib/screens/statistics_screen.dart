import 'package:body_building/helper/constant_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../services/provider/app_provider.dart';

class StatisticsScreen extends StatelessWidget {
  static const String route = "statistics_screen";

  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Statistics"),
      ),
      body: Consumer<AppProvider>(
        builder: (context, model, child) {
          var result = model.resueltOfSheduleModel!;
          return NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowIndicator();
              return true;
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/statistics.jpg",
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 11,
                      left: 11,
                      right: 11,
                      top: 22,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        bulidStatistic(
                          title: "Gender:\t",
                          value: "${result.gender} ",
                        ),
                        SizedBox(height: size.height * 0.01),
                        bulidStatistic(
                          title: "Activity:\t",
                          value: "${result.activity} ",
                        ),
                        SizedBox(height: size.height * 0.01),
                        bulidStatistic(
                          title: "Best Weight:\t",
                          value: "${result.bestWeight.toString()} KM",
                        ),
                        SizedBox(height: size.height * 0.03),
                        Text(
                          "Body Fat Percentage",
                          style: GoogleFonts.lato(
                            color: Color(0xffAB1212),
                            fontWeight: FontWeight.bold,
                            fontSize: 15.5,
                          ),
                        ),
                        SizedBox(height: size.height * 0.015),
                        LinearPercentIndicator(
                          animation: true,
                          lineHeight: 20.0,
                          animationDuration: 2000,
                          percent: 0.8,
                          center: Text(
                            result.bodyFatPercentage.toStringAsFixed(2),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          barRadius: Radius.circular(15),
                          progressColor: Color(0xffAB1212),
                          backgroundColor: MyColors.secondaryColor,
                        ),
                        SizedBox(height: size.height * 0.02),
                        Text(
                          "Drinking Water",
                          style: GoogleFonts.lato(
                            color: Color(0xff0872F6),
                            fontWeight: FontWeight.bold,
                            fontSize: 15.5,
                          ),
                        ),
                        SizedBox(height: size.height * 0.015),
                        LinearPercentIndicator(
                          animation: true,
                          lineHeight: 20.0,
                          animationDuration: 2000,
                          percent: 0.7,
                          center: Text(
                            result.drinkingWater,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          barRadius: Radius.circular(15),
                          progressColor: Color(0xff0872F6),
                          backgroundColor: MyColors.secondaryColor,
                        ),
                        SizedBox(height: size.height * 0.02),
                        Text(
                          "Number Of Steps",
                          style: GoogleFonts.lato(
                            color: Color(0xff0E7105),
                            fontWeight: FontWeight.bold,
                            fontSize: 15.5,
                          ),
                        ),
                        SizedBox(height: size.height * 0.015),
                        LinearPercentIndicator(
                          animation: true,
                          lineHeight: 20.0,
                          animationDuration: 2000,
                          percent: 0.88,
                          center: Text(
                            result.numberOfSteps,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          barRadius: Radius.circular(15),
                          progressColor: Color(0xff0E7105),
                          backgroundColor: MyColors.secondaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Row bulidStatistic({required String title, required String value}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.lato(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            height: 1.3,
          ),
        ),
      ],
    );
  }
}
