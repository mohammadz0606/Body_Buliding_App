import 'package:body_building/constant/constant_style.dart';
import 'package:body_building/constant/constant_widget.dart';
import 'package:body_building/services/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExerciseVideoScreen extends StatelessWidget {
  const ExerciseVideoScreen({Key? key}) : super(key: key);
  static const String route = "exercise_video_screen";

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
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                "https://img.freepik.com/free-photo/morning-concept-attractive-woman-after-running-holding-coffee-tea-relaxing-stay-stairs_496169-1880.jpg?w=740&t=st=1671611620~exp=1671612220~hmac=0ee4277db3e67a4e7f0836773a346d5f67d330e14b94080e4c1b4ab8089efa37",
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              alignment: const Alignment(-0.4, -0.4),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                color: MyColors.firstColor,
                                icon: const Icon(
                                  Icons.play_circle_outline,
                                  size: 90,
                                ),
                              ),
                            )
                          ],
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
