import 'package:body_building/screens/create_schedule/chose_category.dart';
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
    return Consumer<AppProvider>(
      builder: (context, model, child) {
        var resuelt = model.resueltOfSheduleModel!;
        return Scaffold(
          appBar: AppBar(
            title: Text('My Schedule'.toUpperCase()),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowIndicator();
                    return true;
                  },
                  child: DatePicker(
                    DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: MyColors.secondaryColor,
                    selectedTextColor: Colors.white,
                    dateTextStyle: TextStyle(color: Colors.white, fontSize: 17),
                    dayTextStyle: TextStyle(color: Colors.white, fontSize: 11),
                    monthTextStyle: TextStyle(color: Colors.white, fontSize: 11),
                    daysCount: 15,
                  ),
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
                Row(
                  children: [
                    buildExpanded(
                      resuelt: Text(
                        "Height:\n${resuelt.height.toStringAsFixed(1)}m",
                        style: GoogleFonts.lato(
                          fontSize: 15.1,
                          color: Colors.white,
                        ),
                      ),
                      icon: Icons.accessibility,
                    ),
                    buildExpanded(
                      resuelt: Text(
                      "Weight:\n${resuelt.weight.toStringAsFixed(0)}km",
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      icon: Icons.balance,
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.04),
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
                SizedBox(height: size.height * 0.02),
                buildCard(
                  size: size,
                  resuelt: resuelt.finalCarbItems,
                  image: "assets/chose_category/starches.jpg",
                  title: "Starches",
                ),
                buildCard(
                  size: size,
                  resuelt: resuelt.finalFatsItems,
                  image: "assets/chose_category/fats.jpg",
                  title: "Carb",
                ),
                buildCard(
                  size: size,
                  resuelt: resuelt.finalProteinsItems,
                  image: "assets/chose_category/proteins.jpg",
                  title: "Proteins",
                ),
                SizedBox(height: size.height * 0.1),
              ],
            ),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton.small(
                heroTag: null,
                backgroundColor: Color(0xff18DE0E),
                onPressed: () {
                  //model.editScheduleInDatabase(context);
                  //Navigator.of(context).pushReplacementNamed(ChoseCategory.route);
                },
                child: Icon(Icons.edit),
              ),
              SizedBox(height: size.height * 0.01),
              FloatingActionButton(
                heroTag: null,
                backgroundColor: Color(0xffFF0000),
                onPressed: () {
                  model.deleteScheduleInDatabase(
                    context: context,
                  );

                },
                child: Icon(Icons.delete),
              ),
            ],
          ),
        );
      },
    );
  }

  Card buildCard({
    required Size size,
    required List resuelt,
    required String image,
    required String title,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Colors.black,
          width: 1.4,
        ),
      ),
      color: MyColors.secondaryColor,
      margin: EdgeInsets.only(
        top: size.height * 0.03,
        left: size.height * 0.03,
        right: size.height * 0.03,
        bottom: 7,
      ),
      child: Column(
        children: [
          Container(
            width: size.width * 0.9,
            height: size.height * 0.16,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: ExactAssetImage(
                  image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ExpansionTile(
            iconColor: Colors.white,
            collapsedIconColor: Colors.white,
            title: Text(
              title,
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            children: resuelt.map(
              (item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FadeInImage(
                          placeholder: AssetImage("assets/placeholder.gif"),
                          placeholderFit: BoxFit.cover,
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            item["imageUrl"],
                          )),
                    ),
                    title: Text(
                      item["name"],
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Calories: ${item["calories"]}",
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Text(
                          "Quantity: ${item["quantity"]}",
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }

  CircularPercentIndicator buildCircularPercentIndicator({
    required Color color,
    required int number,
  }) {
    return CircularPercentIndicator(
      radius: 46,
      lineWidth: 8.0,
      animation: true,
      animationDuration: 700,
      percent: number > 1000
          ? 0.81
          : number > 500
              ? 0.64
              : 0.45,
      center: Text(
        "${number.toString()}\nCalorie",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
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
