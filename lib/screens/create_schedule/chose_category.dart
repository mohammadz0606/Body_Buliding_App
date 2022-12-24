import 'package:body_building/constant/constant_style.dart';
import 'package:body_building/screens/create_schedule/chose_starches_screen.dart';
import 'package:body_building/services/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/ChoseCategoryButton.dart';

class ChoseCategory extends StatelessWidget {
  static const String route = 'chose_type_of_food';

  const ChoseCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('CREATE SCHEDULE'),
        ),
        body: Center(
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
                    'You have ${Provider.of<AppProvider>(context).calories} Calories',
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
        ));
  }
}
