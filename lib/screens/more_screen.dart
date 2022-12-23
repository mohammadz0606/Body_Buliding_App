import 'package:body_building/constant/constant_style.dart';
import 'package:flutter/material.dart';

import '../widgets/more_screen_button.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);
  static const String route = "more_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: MyColors.secondaryColor,
        body: Container(
      color: Color.fromRGBO(39, 42, 78, 1.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Color.fromRGBO(12, 18, 52, 1)),
                accountName: Text('Bashar Qasrawi',
                    style: TextStyle(color: Colors.white)),
                accountEmail: Text(
                  'BasharQasrawi118@gmail.com'.toLowerCase(),
                  style: TextStyle(color: Colors.white),
                ),
                currentAccountPicture: CircleAvatar(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset('assets/exercise.jpg'),
                  ),
                )),
            MoreScreenButton(label: 'Account',color: Colors.white,icon: Icons.person,onTap: (){},),
            MoreScreenButton(label: 'About App',color: Colors.white,icon: Icons.account_tree_outlined,onTap: (){},),
            MoreScreenButton(label: 'My Schedule',color: Colors.white,icon: Icons.fastfood_rounded,onTap: (){},),
            MoreScreenButton(label: 'Log Out',color: Colors.red,icon: Icons.logout,onTap: (){},),

          ],
        ),
      ),
    ));
  }
}

