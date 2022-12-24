import 'package:body_building/constant/constant_style.dart';
import 'package:body_building/services/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../services/models/on_boarding_model.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  static const String route = "on_boarding_screen";
  final PageController _pageController = PageController();
  final List<OnBoardingModel> _pageViewList = const [
    OnBoardingModel(
      titel: "Workout Anywhere",
      description:
          "Choose your preferred location and\nDo your workouts anytime that suits\nYou",
      image: "assets/on_boarding/onboarding01.jpg",
    ),
    OnBoardingModel(
      titel: "Track your Progress",
      description:
          "Check yourself at Cach Workout\nPhase and update\nyour Fitness Prowle",
      image: "assets/on_boarding/onboarding02.jpg",
    ),
    OnBoardingModel(
      titel: "Strong & Healthy",
      description:
          "We want you to stay Strong and healthy\nSo we have provided a Diet plan for you.\nEnjoy!",
      image: "assets/on_boarding/onboarding03.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: Consumer<AppProvider>(
        builder: (context, model, child) {
          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (int? indexChang) {
                    model.onPageViewChanged(
                      indexChang: indexChang,
                      items: _pageViewList,
                    );
                  },
                  itemCount: _pageViewList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Container(
                          height: size.height * 0.5,
                          width: size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(_pageViewList[index].image),
                            ),
                          ),
                        ),
                        Container(
                          height: size.height * 0.5,
                          width: size.width,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                MyColors.primaryColor,
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: size.height * 0.095,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 22),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _pageViewList[index].titel,
                                  style: GoogleFonts.notoSansJavanese(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28,
                                  ),
                                ),
                                Text(
                                  _pageViewList[index].description,
                                  softWrap: true,
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    height: 1.5,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: _pageViewList.length,
                      effect: ExpandingDotsEffect(
                        dotColor: Colors.white,
                        activeDotColor: MyColors.secondaryColor,
                        dotHeight: 10,
                        dotWidth: 10,
                        expansionFactor: 4,
                        spacing: 5,
                      ),
                    ),
                    FloatingActionButton(
                      backgroundColor: MyColors.secondaryColor,
                      onPressed: () {
                        model.isLast
                            ? model.endPageView(context)
                            : _pageController.nextPage(
                                duration: const Duration(milliseconds: 750),
                                curve: Curves.fastLinearToSlowEaseIn,
                              );
                      },
                      child: const Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
