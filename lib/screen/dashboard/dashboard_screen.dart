import 'package:cohort_app/screen/home/home_screen.dart';
import 'package:cohort_app/screen/mytrip/mytrip_screen.dart';
import 'package:cohort_app/screen/profile/profile_screen.dart';
import 'package:cohort_app/screen/setting/setting_screen.dart';
import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/string.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: currentTab,
          children: <Widget>[
            HomeScreen(),
            MyTripScreen(),
            ProfileScreen(),
            SettingScreen()
          ],
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
}
