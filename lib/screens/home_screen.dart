import 'package:body_building/constant/constant_style.dart';
import 'package:body_building/constant/constant_widget.dart';
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
      backgroundColor: MyColors.primaryColor,
      body: Consumer<AppProvider>(
        builder: (context, model, child) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 13),
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
                  padding: const EdgeInsets.only(top: 35, left: 22, bottom: 11),
                  child: Text(
                    "The best coaches right now",
                    style: GoogleFonts.merriweather(
                      color: Colors.white,
                      fontSize: 17.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                model.trainers.isEmpty
                    ? ConstantWidget.circularProgressIndicator()
                    : Padding(
                        padding:
                            const EdgeInsets.only(top: 8, bottom: 8, left: 8),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: model.trainers.length,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: size.height * 0.030);
                          },
                          itemBuilder: (context, index) {
                            var trainer = model.trainers[index];
                            return Row(
                              children: [
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
                                      height: size.height / 3.1,
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
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: const BorderSide(
                                        width: 2,
                                        color: MyColors.primaryColor,
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 10,
                                            left: 10,
                                            right: 10,
                                            bottom: 5,
                                          ),
                                          child: Text(
                                            trainer.name,
                                            style: GoogleFonts.lato(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        CustomDivider(),
                                        CustomListTitle(
                                          onTap: () async {
                                            await model.openInstagram(
                                              instagram: trainer.instgram,
                                              context: context,
                                            );
                                          },
                                          size: size,
                                          icon:
                                              "assets/social_icons/instagram_logo.png",
                                          title: "Instagram",
                                        ),
                                        CustomDivider(),
                                        CustomListTitle(
                                          onTap: () async {
                                            await model.openTiktok(
                                              tiktok: trainer.tiktok,
                                              context: context,
                                            );
                                          },
                                          size: size,
                                          icon:
                                              "assets/social_icons/tiktok_logo.png",
                                          title: "Tiktok",
                                        ),
                                        CustomDivider(),
                                        CustomListTitle(
                                          onTap: () async {
                                            print(
                                                "your phone is : ${trainer.whats}");
                                            await model.openWhatsAppChat(
                                              phone: trainer.whats,
                                              context: context,
                                            );
                                          },
                                          size: size,
                                          icon:
                                              "assets/social_icons/social_whats.png",
                                          title: "Whats",
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
              ],
            ),
          );
        },
      ),
    );
  }

// ignore: non_constant_identifier_names
  Widget CustomDivider() {
    return const Divider(
      thickness: 1.1,
      color: MyColors.primaryColor,
    );
  }

  // ignore: non_constant_identifier_names
  Widget CustomListTitle({
    required Size size,
    required String icon,
    required String title,
    required Function() onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Image.asset(
        icon,
        width: size.width / 12,
        fit: BoxFit.cover,
      ),
      title: Text(
        title,
        style: GoogleFonts.anticSlab(
          fontWeight: FontWeight.w600,
          fontSize: 17,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.black,
      ),
    );
  }
}

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
