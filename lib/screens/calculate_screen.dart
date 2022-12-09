import 'package:flutter/material.dart';

import '../constant/constant_style.dart';

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({Key? key}) : super(key: key);

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  double sliderVal = 0;
  int age = 0;
  int weight = 150;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
              padding: const EdgeInsets.all(20),

              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        genderMethode(size, 'MALE', Icons.male),
                        genderMethode(size, 'FEMALE', Icons.female)
                      ],
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: MyColors.secondaryColor,
                      margin: EdgeInsets.all(size.width * 0.04),
                      width: double.infinity,
                      height: size.height * 0.25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                0, size.height * 0.01, 0, size.height * 0.03),
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
                                sliderVal.round().toString(),
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
                              divisions: 300,
                              max: 300,
                              min: 0,
                              value: sliderVal,
                              onChanged: (val) {
                                setState(() {
                                  sliderVal = val;
                                });
                              }),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(size.width * 0.01),
                          width: size.width * 0.4,
                          height: size.height * 0.25,
                          alignment: Alignment.center,
                          color: MyColors.secondaryColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    0, 0, 0, size.height * 0.02),
                                child: Text(
                                  'WEIGHT',
                                  style: TextStyle(
                                      fontSize: size.width * 0.050,
                                      color: Colors.grey),
                                ),
                              ),
                              Text(
                                weight.toString(),
                                style: TextStyle(
                                    fontSize: size.width * 0.13,
                                    color: Colors.white),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  FloatingActionButton(
                                    backgroundColor: const Color(0x353956FF),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        weight += 1;
                                      });
                                    },
                                  ),
                                  FloatingActionButton(
                                    backgroundColor: const Color(0x353956FF),
                                    child: Text(
                                      '-',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: size.width * 0.1),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        weight -= 1;
                                      });
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(size.width * 0.01),
                          width: size.width * 0.4,
                          height: size.height * 0.25,
                          alignment: Alignment.center,
                          color: MyColors.secondaryColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    0, 0, 0, size.height * 0.02),
                                child: Text(
                                  'AGE',
                                  style: TextStyle(
                                      fontSize: size.width * 0.050,
                                      color: Colors.grey),
                                ),
                              ),
                              Text(
                                age.toString(),
                                style: TextStyle(
                                    fontSize: size.width * 0.13,
                                    color: Colors.white),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  FloatingActionButton(
                                    backgroundColor: const Color(0x353956FF),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        age += 1;
                                      });
                                    },
                                  ),
                                  FloatingActionButton(
                                    backgroundColor: const Color(0x353956FF),
                                    child: Text(
                                      '-',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: size.width * 0.1),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        age -= 1;
                                      });
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        genderMethode(size, 'drying of fat'.toUpperCase(),
                            Icons.sports_gymnastics_sharp),
                        genderMethode(size, 'muscular'.toUpperCase(),
                            Icons.sports_gymnastics_sharp)
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    )
                  ],
                ),
              )),
          Positioned(
            bottom: 0,
            left: size.width / 4,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'CALCULATE',
                  style: TextStyle(fontSize: size.width * 0.07),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  InkWell genderMethode(
    Size size,
    String title,
    IconData icon,
  ) {
    return InkWell(
      onTap: () {
        print(title);
      },
      child: Container(
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
                size: size.width * 0.28,
                color: Colors.grey,
              ),
            ),
            Text(
              title,
              style: TextStyle(fontSize: size.width * 0.05, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
