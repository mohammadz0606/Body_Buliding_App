import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/provider/app_provider.dart';

class StatisticsScreen extends StatelessWidget {
  static const String route = "statistics_screen";

  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statistics"),
      ),
      body: Consumer<AppProvider>(
        builder: (context, value, child) {
          return NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowIndicator();
              return true;
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
            ),
          );
        },
      ),
    );
  }
}
