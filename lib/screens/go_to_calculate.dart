import 'package:body_building/helper/constant_style.dart';
import 'package:body_building/screens/calculate_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/submit_item_button.dart';

class GoToCalculatePage extends StatelessWidget {
  static const String rout = 'go_to_calculate';

  const GoToCalculatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.fromLTRB(35, 70, 35, 20),
                    child: Image.asset('assets/go_to_calculate_image.png')),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                  child: const Text(
                    'Please calculate your calories',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ],

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
                          'Do you want to ',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          'Calculate ',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'your calories? ',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SubmitItemButton(
                          size: size,
                          label: 'Maybe later',
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          backgroundColor: MyColors.secondaryColor,
                          labelColor: Colors.red,
                        ),
                        SubmitItemButton(
                          size: size,
                          label: 'Calculate',
                          onTap: () {
                            Navigator.of(context).pushReplacementNamed(CalculateScreen.route);
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
      ),
    );
  }
}
