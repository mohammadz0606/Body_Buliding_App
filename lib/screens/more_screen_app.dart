import 'package:body_building/screens/about_screen.dart';
import 'package:body_building/screens/create_schedule/chose_category.dart';
import 'package:body_building/screens/go_to_calculate.dart';
import 'package:body_building/screens/go_to_chose_food_screen.dart';
import 'package:body_building/services/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../helper/constant_style.dart';
import '../helper/constant_widget.dart';
import '../widgets/more_screen_button.dart';
import 'auth/login_screen.dart';
import 'bmi_result_screen.dart';

class MoreAppScreen extends StatelessWidget {
  const MoreAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColors.secondaryColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          color: Color.fromRGBO(39, 42, 78, 1.0),
          child: Consumer<AppProvider>(
            builder: (context, model, child) {
              return Column(
                children: [
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(12, 18, 52, 1),
                    ),
                    accountName: Text(
                      model.userModel!.name,
                      style: TextStyle(color: Colors.white),
                    ),
                    accountEmail: Text(
                      model.userModel!.email,
                      style: TextStyle(color: Colors.white),
                    ),
                    currentAccountPicture: CircleAvatar(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 70,
                            backgroundImage:
                                AssetImage("assets/blank-profile.jpg"),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: model.profileImage == null
                                  ? FadeInImage(
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      placeholder: const AssetImage(
                                        "assets/blank-profile.jpg",
                                      ),
                                      image: NetworkImage(
                                        model.userModel!.userImage,
                                      ),
                                    )
                                  : Image.file(
                                      model.profileImage!,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                            ),
                          ),
                          Positioned(
                            top: size.height * 0.046,
                            left: size.width * 0.090,
                            child: _editImageProfile(
                              icon: Icons.add_a_photo,
                              onPressed: () {
                                ConstantWidget.dialog(
                                  context: context,
                                  title: Text(
                                    "Choose one of the following",
                                    style: TextStyle(
                                      color: MyColors.primaryColor,
                                    ),
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      _itemDialog(
                                        onTap: () {
                                          model.getProfileImage(
                                            context: context,
                                            source: ImageSource.camera,
                                          );
                                          Navigator.of(context).pop();
                                        },
                                        text: "Camera",
                                        icon: Icons.camera,
                                      ),
                                      const SizedBox(height: 13),
                                      _itemDialog(
                                        onTap: () {
                                          model.getProfileImage(
                                            context: context,
                                            source: ImageSource.gallery,
                                          );
                                          Navigator.of(context).pop();
                                        },
                                        text: "Image",
                                        icon: Icons.image,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  MoreScreenButton(
                    label: 'Share App',
                    color: Colors.white,
                    icon: Icons.share,
                    onTap: () {
                      model.shareApp();
                    },
                  ),
                  MoreScreenButton(
                    label: 'About App',
                    color: Colors.white,
                    //icon: Icons.account_tree_outlined,
                    icon: Icons.info,
                    onTap: () {
                      Navigator.of(context).pushNamed(AboutScreen.route);
                    },
                  ),
                  MoreScreenButton(
                    label: 'My Schedule',
                    color: Colors.white,
                    icon: Icons.fastfood_rounded,
                    onTap: () {
                      if(model.calories == null){
                        Navigator.of(context).pushNamed(GoToCalculatePage.rout);
                      }else if(model.finalProteinsItems.isEmpty||model.finalCarbItems.isEmpty||model.finalFatsItems.isEmpty){
                        Navigator.of(context).pushNamed(GoToChooseMealPage.rout);
                      }else{
                        Navigator.of(context).pushNamed(BMIResultScreen.route);
                      }
                    },
                  ),
                  MoreScreenButton(
                    label: 'Log Out',
                    color: Colors.red,
                    icon: Icons.logout,
                    onTap: () {
                      model.signOut();
                      Navigator.of(context).pushReplacementNamed(
                        LoginScreen.route,
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  InkWell _itemDialog({
    required Function() onTap,
    required IconData icon,
    required String text,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
          ),
          const SizedBox(width: 7),
          Text(
            text,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _editImageProfile({
    required Function() onPressed,
    required IconData icon,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: CircleAvatar(
        backgroundColor: MyColors.firstColor,
        radius: 12,
        child: Icon(
          icon,
          color: Colors.white,
          size: 13.5,
        ),
      ),
    );
  }
}
