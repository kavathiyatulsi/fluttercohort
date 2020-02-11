import 'package:cohort_app/theme/string.dart';
import 'package:flutter/material.dart';

import 'color.dart';

ThemeData themeData = ThemeData(
    primaryColor: black,
    accentColor: white,
    fontFamily: poppins,
    textTheme: TextTheme(
        body1: TextStyle(
            fontSize: 20.0,
            color: white,
            fontFamily: poppinsSemiBold,
            fontWeight: FontWeight.w600),
        body2: TextStyle(
            fontSize: 16.0,
            color: white,
            fontFamily: poppinsSemiBold,
            fontWeight: FontWeight.w600),
        display1: TextStyle(
          fontSize: 16.0,
          color: white,
          fontFamily: poppinsRegular,
        ),
        display2: TextStyle(
            fontSize: 16.0,
            color: white,
            fontFamily: poppinsMedium,
            fontWeight: FontWeight.w600),
        display3: TextStyle(
            fontSize: 14.0,
            color: white,
            fontFamily: poppinsMedium,
            fontWeight: FontWeight.w600)));

TextStyle textSize10 = TextStyle(fontSize: 10.0, color: white, fontFamily: poppinsMedium);
TextStyle profileTextSmall = TextStyle(fontSize: 9.0, color: gray, fontFamily: poppinsRegular);
TextStyle profileTextBig = TextStyle(fontSize: 14.0, color: black, fontFamily: poppinsMedium);
TextStyle grayRegularSize12 = TextStyle(fontSize: 12.0, color: gray, fontFamily: poppinsRegular);
TextStyle grayRegularSize10 = TextStyle(fontSize: 10.0, color: gray, fontFamily: poppinsRegular);
TextStyle blackRegularSize10 = TextStyle(fontSize: 10.0, color: black, fontFamily: poppinsRegular);
TextStyle whiteRegularSize10 = TextStyle(fontSize: 10.0, color: white, fontFamily: poppinsRegular);
TextStyle blackMediumSize16 = TextStyle(fontSize: 16.0, color: black, fontFamily: poppinsMedium);
TextStyle grayMediumSize12 = TextStyle(fontSize: 12.0, color: gray, fontFamily: poppinsMedium);
TextStyle blackMediumSize12 = TextStyle(fontSize: 12.0, color: black, fontFamily: poppinsMedium);
TextStyle blackSize12 = TextStyle(fontSize: 12.0, color: black, fontFamily: poppinsRegular);
