import 'package:body_building/constant/constant_style.dart';
import 'package:body_building/constant/constant_widget.dart';
import 'package:body_building/screens/auth/login_screen.dart';
import 'package:body_building/screens/no_internet_screen.dart';
import 'package:body_building/services/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import '../widgets/title_app.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);
  static const String route = "home_screen";

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AppProvider>(context, listen: false).getDataForeFireStore();
      Provider.of<AppProvider>(context, listen: false).getTrainers();
      Provider.of<AppProvider>(context, listen: false).getCategory();
      Provider.of<AppProvider>(context, listen: false).getAllExcercises();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (
        BuildContext context,
        AppProvider model,
        Widget? child,
      ) {
        return OfflineBuilder(
          connectivityBuilder: ( BuildContext context,
              ConnectivityResult connectivity,
              Widget child,) {
            final bool connected = connectivity != ConnectivityResult.none;
            if(connected){
              return Scaffold(
                appBar: AppBar(
                  title: const TitleApp(),
                ),
                body: model.userModel == null
                    ? ConstantWidget.circularProgressIndicator()
                    : model.screens[model.selectedIndex],
                bottomNavigationBar: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, -2),
                      )
                    ],
                  ),
                  child: GNav(
                    padding: EdgeInsets.only(top: 25,bottom: 25,left: 21,right: 21),
                    selectedIndex: model.selectedIndex,
                    onTabChange: (int index) {
                      model.onTabChange(index);
                    },
                    gap: 7,
                    activeColor: Colors.white,
                    color: Colors.white,
                    rippleColor: MyColors.secondaryColor,
                    hoverColor: MyColors.secondaryColor,
                    backgroundColor: MyColors.primaryColor,
                    duration: const Duration(milliseconds: 400),
                    tabs: const [
                      GButton(
                        icon: Icons.home_filled,
                        text: 'Home',
                      ),
                      GButton(
                        icon: Icons.calculate,
                        text: 'Calculate',
                      ),
                      GButton(
                        icon: Icons.fitness_center,
                        text: 'Exercises',
                      ),
                      GButton(
                        //icon: Icons.more_horiz,
                        icon: Icons.accessibility,
                        text: 'More',
                      ),
                    ],
                  ),
                ),
              );
            }else{
              return const NoInterNetScreen();
            }
          },
          child: const NoInterNetScreen(),
        );
      },
    );
  }
}

