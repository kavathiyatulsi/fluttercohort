import 'package:cohort_app/screen/home/widget/BestExperience.dart';
import 'package:cohort_app/screen/home/widget/BudgetPackage.dart';
import 'package:cohort_app/screen/home/widget/PackageView.dart';
import 'package:cohort_app/screen/home/widget/PopularPackage.dart';
import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/string.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            topView(),
            PopularPackage(),
            PackageView(bestExperience),
            BestExperience(),
            BudgetPackage()],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget bottomNavigationBar() => BottomNavigationBar(
        currentIndex: currentTab,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            this.currentTab = index;
          });
        },
        items: [
          new BottomNavigationBarItem(
            title: Text(''),
            icon: ImageIcon(
              AssetImage(iconHome),
              color: currentTab == 0 ? blue : black,
            ),
          ),
          new BottomNavigationBarItem(
            title: Text(''),
            icon: ImageIcon(
              AssetImage(iconHomeSearch),
              color: currentTab == 1 ? blue : black,
            ),
          ),
          new BottomNavigationBarItem(
            title: Text(''),
            icon: ImageIcon(
              AssetImage(iconUser),
              color: currentTab == 2 ? blue : black,
            ),
          ),
          new BottomNavigationBarItem(
            title: Text(''),
            icon: ImageIcon(
              AssetImage(iconSetting),
              color: currentTab == 3 ? blue : black,
            ),
          ),
        ],
      );

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
