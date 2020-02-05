import 'package:cohort_app/theme/string.dart';
import 'package:cohort_app/utils/auth.dart';
import 'package:cohort_app/screen/login/login_view.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: getBackGroundImage(context),
          ),
          Positioned(
            top: 200.0,
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: LoginView(login, singIn, true, donHaveAccount, new Auth()),
          ),
        ],
      ),
    );
  }
}
/*
Stack(
        children: <Widget>[
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: getBackGroundImage(context),
          ),
          Positioned(
            top: 200.0,
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: LoginView(login, singIn, true, donHaveAccount, new Auth()),
          ),
        ],
      )
 */
Widget getBackGroundImage(BuildContext context) => Container(
      height: MediaQuery.of(context).size.height / 3.1,
      decoration: BoxDecoration(
          image: new DecorationImage(
              image: new AssetImage(loginBackground), fit: BoxFit.fill)),
    );
