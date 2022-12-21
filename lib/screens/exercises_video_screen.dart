import 'package:body_building/constant/constant_style.dart';
import 'package:body_building/constant/constant_widget.dart';
import 'package:body_building/services/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ExerciseVideoScreen extends StatelessWidget {
  static const String route = "exercise_video_screen";

  const ExerciseVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(model.appBarTitle),
          ),
          body: model.excercisesFillters.isEmpty
              ? ConstantWidget.circularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                    padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 7 / 8,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: model.excercisesFillters.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () async {
                            await model.excercisesVideo(
                                      video:
                                          model.excercisesFillters[index].video,
                                      context: context,
                                    );
                          },
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  "assets/exercise.jpg",
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Icon(
                                  color: MyColors.firstColor,
                                  Icons.play_circle_outline,
                                  size: 90,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}
