import 'package:cohort_app/screen/dashboard/dashboard_screen.dart';
import 'package:cohort_app/screen/splash_screen.dart';
import 'package:cohort_app/theme/style.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeData,
      home: DashBoardScreen(),
    );
  }
}


