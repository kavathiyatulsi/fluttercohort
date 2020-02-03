import 'package:cohort_app/screen/login_screen.dart';
import 'package:cohort_app/screen/register_screen.dart';
import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/string.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage(background), fit: BoxFit.fill)),
          ),
          Positioned(
              right: 50.0,
              left: 50.0,
              top: 100.0,
              child: Hero(
                tag: background,
                child: Image.asset(logo),
              )),
          Positioned(
            bottom: 40.0,
            right: 50.0,
            left: 50.0,
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => RegisterScreen())),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(width: 1.0, color: white)),
                    child: Text(
                      register,
                      style:
                          Theme.of(context).textTheme.body2.apply(color: white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => LoginScreen())),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: white),
                    child: Text(
                      login,
                      style:
                          Theme.of(context).textTheme.body2.apply(color: black),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
