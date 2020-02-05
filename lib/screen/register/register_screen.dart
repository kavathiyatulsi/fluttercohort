import 'package:cohort_app/theme/string.dart';
import 'package:cohort_app/utils/auth.dart';
import 'package:cohort_app/screen/login/login_view.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
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
            child: Container(
              height: MediaQuery.of(context).size.height/3.1,
              decoration: BoxDecoration(
                  image: new DecorationImage(
                      image: new AssetImage(registerBackground), fit: BoxFit.fill)),
            ),
          ),
          Positioned(
              top: 200.0,
              left: 0.0,
              right: 0.0,
              bottom: 0.0,
              child: LoginView(
                  register, singUp, false, alreadyAccount, new Auth())),
        ],
      ),
    );
  }
}
