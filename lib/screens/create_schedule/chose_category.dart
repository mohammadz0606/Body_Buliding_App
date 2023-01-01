import 'package:body_building/screens/nav_screen.dart';
import 'package:body_building/services/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helper/constant_style.dart';
import '../../widgets/ChoseCategoryButton.dart';
import '../../widgets/submit_item_button.dart';
import '../calculate_screen.dart';

class ChoseCategory extends StatelessWidget {
  static const String route = 'chose_type_of_food';

  const ChoseCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(leading: Container(),
          title: Text('CREATE SCHEDULE'),
        ),
        body: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: size.width * 0.9,
                      margin: EdgeInsets.all(size.height * 0.03),
                      height: size.height * 0.2,
                      decoration: BoxDecoration(
                        color: MyColors.secondaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'You have ${Provider.of<AppProvider>(context).calories1} Calories',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                    Text(
                      'Chose Category :',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    TypeFoodButton(
                      type: 0,
                      size: size,
                      label: 'Starches',
                      imageUrl:
                          'https://foodrevolution.org/wp-content/uploads/iStock-177273143_rev2.jpg',
                    ),
                    TypeFoodButton(
                      type: 1,
                      size: size,
                      label: 'Fats',
                      imageUrl:
                          'https://i1.wp.com/www.differencebetween.com/wp-content/uploads/2021/11/Grains.jpg',
                    ),
                    TypeFoodButton(
                      type: 2,
                      size: size,
                      label: 'Proteins',
                      imageUrl:
                          'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F44%2F2021%2F08%2F10%2Fwhat-is-protein.jpg',
                    ),
                  ],
                ),
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
                            'Apply your  ',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Text(
                            'Meals ',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SubmitItemButton(
                            size: size,
                            label: 'Discard',
                            onTap: () {
                              Provider.of<AppProvider>(context, listen: false)
                                  .cancelMeals(context);
                              if (Navigator.of(context).canPop()) {
                                Navigator.of(context).pop();
                              } else {
                                Provider.of<AppProvider>(context, listen: false)
                                    .onTabChange(0);

                                Navigator.of(context)
                                    .pushReplacementNamed(NavScreen.route);
                              }
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
        ));
  }
}
