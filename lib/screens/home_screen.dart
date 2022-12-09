import 'package:body_building/constant/constant_style.dart';
import 'package:body_building/constant/constant_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

import '/services/provider/app_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final List<String> _carouselImage = [
    "assets/carousel_images/ezgif-2.jpg",
    "assets/carousel_images/attractive-young-woman-her-trainer-running-treadmill-gym.jpg",
    "assets/carousel_images/ezgif-2-01c6f8e607.jpg",
    "assets/carousel_images/ezgif-2-f8daed614f.jpg",
    "assets/carousel_images/high-five-after-workout-gym.jpg",
    "assets/carousel_images/muscular_hypertrophyf.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<AppProvider>(
        builder: (context, model, child) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                CarouselSlider.builder(
                  itemCount: _carouselImage.length,
                  itemBuilder: (context, index, realIndex) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        _carouselImage[index],
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  options: CarouselOptions(
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    pauseAutoPlayOnTouch: true,
                    viewportFraction: 0.8,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      model.onPageChanged(index: index);
                    },
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                DotsIndicator(
                  dotsCount: _carouselImage.length,
                  position: double.parse(model.currentIndex.toString()),
                  decorator: DotsDecorator(
                    activeColor: MyColors.firstColor,
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 40, left: 22, bottom: 11),
                  child: Text(
                    "The best coaches right now",
                    style: GoogleFonts.merriweather(
                      color: Colors.white,
                      fontSize: 16.5,
                    ),
                  ),
                ),
                model.trainers.isEmpty
                    ? ConstantWidget.circularProgressIndicator()
                    : Padding(
                        padding: const EdgeInsets.all(20),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: model.trainers.length,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: size.height * 0.052);
                          },
                          itemBuilder: (context, index) {
                            var trainer = model.trainers[index];
                            return Row(
                              children: [
                                /*
                                CachedNetworkImage(
                                  imageUrl: "https://firebasestorage.googleapis.com/v0/b/body-building-295c3.appspot.com/o/trainers%2F%D8%B5%D9%87%D9%8A%D8%A8%20%D8%A7%D9%84%D9%88%D8%AD%D8%B4.png?alt=media&token=1fed7007-cd68-4ab3-b381-2b122ffddc94",
                                  height: 200,
                                  width: 200,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) {
                                    return Image.asset(
                                      "assets/blank-profile.jpg",
                                      height: 200,
                                      width: 200,
                                      fit: BoxFit.cover,
                                    );
                                  },
                                  errorWidget: (context, url, error) {
                                    return Text(error.toString());
                                  },
                                  imageBuilder: (context, imageProvider) {
                                    return Container(
                                      height: 500,
                                      width: 500,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                        ),
                                      ),
                                    );
                                  },
                                ),
*/
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: MyColors.primaryColor,
                                    ),
                                    borderRadius: BorderRadius.circular(17),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(17),
                                    child: FadeInImage(
                                      fit: BoxFit.cover,
                                      height: size.height / 3.6,
                                      width: size.width / 2.55,
                                      placeholder: const AssetImage(
                                        "assets/blank-profile.jpg",
                                      ),
                                      image: NetworkImage(
                                        trainer.image,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(trainer.name),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
