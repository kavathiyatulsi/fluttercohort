import 'package:cohort_app/theme/string.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'intro_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => IntroScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: background,
            child: Container(
              decoration: BoxDecoration(
                  image: new DecorationImage(
                      image: AssetImage(background), fit: BoxFit.fill)),
            ),
          ),
          Center(
            child: Image.asset(logo),
          )
        ],
      ),
    );
  }
}
