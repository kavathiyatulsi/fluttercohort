import 'package:cohort_app/screen/home/widget/BestExperience.dart';
import 'package:cohort_app/screen/home/widget/BudgetPackage.dart';
import 'package:cohort_app/screen/home/widget/CommonTextView.dart';
import 'package:cohort_app/screen/home/widget/PopularPackage.dart';
import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/string.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              topView(),
              PopularPackage(),
              CommonTextView(bestExperience),
              BestExperience(),
              BudgetPackage()
            ],
          ),
        ),
      ),
    );
  }

  topView() {
    return Stack(
      children: <Widget>[
        Container(
          height: 240.0,
          decoration: BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage(homeBackground), fit: BoxFit.cover)),
        ),
        Positioned(
          bottom: 20.0,
          right: 30.0,
          left: 30.0,
          child: StreamBuilder<String>(
            builder: (context, snapshote) => Container(
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(35.0)),
              child: TextField(
                decoration: new InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: new Icon(Icons.search),
                    hintText: 'Search...'),
              ),
            ),
          ),
        )
      ],
    );
  }
}
