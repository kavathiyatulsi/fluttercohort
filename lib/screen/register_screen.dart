import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/string.dart';
import 'package:cohort_app/utils/auth.dart';
import 'package:cohort_app/widget/login_view.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage(registerBackground),
                    fit: BoxFit.fill)),
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
