import 'package:body_building/services/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../helper/constant_widget.dart';
import 'exercises_video_screen.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<AppProvider>(
        builder: (context, model, child) {
          return model.category.isEmpty
              ? ConstantWidget.circularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: model.category.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: size.height * 0.030);
                    },
                    itemBuilder: (context, index) {
                      var category = model.category[index];
                      return InkWell(
                        borderRadius: BorderRadius.circular(18),
                        onTap: () {
                          model.excercisesFillter(id: category.id,appBarTitle: category.title);
                          Navigator.of(context).pushNamed(
                            ExerciseVideoScreen.route,
                          );
                        },
                        child: Card(
                          elevation: 15,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: FadeInImage(
                                  fit: BoxFit.cover,
                                  height: size.height / 3.1,
                                  width: double.infinity,
                                  placeholder: const AssetImage(
                                    "assets/placeholder.gif",
                                  ),
                                  image: NetworkImage(
                                    category.image,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, bottom: 20),
                                child: Text(
                                  category.title,
                                  style: GoogleFonts.gelasio(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.3,
                                    fontSize: 23,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
        },
      ),
    );
  }
}
