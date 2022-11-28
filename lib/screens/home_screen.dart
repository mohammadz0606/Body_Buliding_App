import 'package:body_building/constant/constant_widget.dart';
import 'package:body_building/screens/auth/login_screen.dart';
import 'package:body_building/services/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String route = "home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<AppProvider>(context, listen: false).getDataForeFireStore();
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
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                model.signOut();
                Navigator.of(context).pushReplacementNamed(LoginScreen.route);
              },
              icon: const Icon(Icons.logout),
            ),
          ),
          body: model.userModel == null
              ? ConstantWidget.circularProgressIndicator()
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(model.userModel!.name),
                      Text(model.userModel!.email),
                      Text(model.userModel!.bio),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
