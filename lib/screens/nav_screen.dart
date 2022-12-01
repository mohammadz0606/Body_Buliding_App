import 'package:body_building/constant/constant_style.dart';
import 'package:body_building/constant/constant_widget.dart';
import 'package:body_building/screens/auth/login_screen.dart';
import 'package:body_building/services/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);
  static const String route = "home_screen";

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  @override
  void initState() {
    Provider.of<AppProvider>(context,listen: false).getDataForeFireStore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(

      builder: (
        BuildContext context,
        AppProvider model,
        Widget? child,
      ) {
        return Scaffold(
          appBar:model.selectedIndex == 2? AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  model.signOut();
                  Navigator.of(context).pushReplacementNamed(LoginScreen.route);
                },
                icon: const Icon(Icons.logout),
              ),
              const SizedBox(width: 6),
            ],
          ) : null,
          body: model.userModel == null
              ? ConstantWidget.circularProgressIndicator()
              : model.screens[model.selectedIndex],
          bottomNavigationBar: GNav(
            selectedIndex: model.selectedIndex,
            onTabChange: (int index){
              model.onTabChange(index);
            },
            gap: 10,
              activeColor: Colors.white,
              color: Colors.white,
              rippleColor: MyColors.secondColor,
            hoverColor: MyColors.secondColor,
              duration: const Duration(milliseconds: 400),
              tabs: const [
                GButton(
                  icon:Icons.home_filled,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.calculate,
                  text: 'Calculate',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'My Profile',
                ),

              ]
          ),
        );
      },
    );
  }
}
