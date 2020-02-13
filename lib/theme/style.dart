import 'package:cohort_app/theme/string.dart';
import 'package:flutter/material.dart';

import 'color.dart';

ThemeData themeData = ThemeData(
    primaryColor: black,
    accentColor: white,
    fontFamily: poppins,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
          color: gray,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          fontSize: 18.0),
      labelStyle: TextStyle(
          color: gray,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          fontSize: 18.0),
      focusedBorder: new UnderlineInputBorder(
        borderSide: BorderSide(color: black, width: 2),
      ),
      focusedErrorBorder: new UnderlineInputBorder(
        borderSide: BorderSide(color: red, width: 2),
      ),
      border: new UnderlineInputBorder(
        borderSide: BorderSide(color: gray, width: 2),
      ),
      enabledBorder: new UnderlineInputBorder(
        borderSide: BorderSide(color: gray, width: 2),
      ),
      disabledBorder: new UnderlineInputBorder(
        borderSide: BorderSide(color: gray, width: 2),
      ),
      contentPadding: const EdgeInsets.fromLTRB(0, 12, 8, 12),
    ),
    textTheme: TextTheme(
        body1: TextStyle(
          fontSize: 20.0,
          color: white,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
        ),
        body2: TextStyle(
          fontSize: 16.0,
          color: white,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
        ),
        display1: TextStyle(
          fontSize: 16.0,
          color: white,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
        ),
        display2: TextStyle(
            fontSize: 16.0,
            color: white,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal),
        display3: TextStyle(
            fontSize: 14.0,
            color: white,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal)));

TextStyle textSize10 = TextStyle(fontSize: 10.0, color: white, fontFamily: poppinsMedium,fontWeight: FontWeight.w600);
TextStyle profileTextSmall = TextStyle(fontSize: 9.0, color: gray, fontFamily: poppinsRegular);
TextStyle profileTextBig = TextStyle(fontSize: 14.0, color: black, fontFamily: poppinsMedium);
TextStyle grayRegularSize12 = TextStyle(fontSize: 12.0, color: gray, fontFamily: poppinsRegular);
TextStyle grayRegularSize10 = TextStyle(fontSize: 10.0, color: gray, fontFamily: poppinsRegular);
TextStyle blackRegularSize10 = TextStyle(fontSize: 10.0, color: black, fontFamily: poppinsRegular);
TextStyle whiteRegularSize10 = TextStyle(fontSize: 10.0, color: white, fontFamily: poppinsRegular);
TextStyle blackMediumSize16 = TextStyle(fontSize: 16.0, color: black, fontFamily: poppinsMedium);
TextStyle grayMediumSize12 = TextStyle(fontSize: 12.0, color: gray, fontFamily: poppinsMedium);
TextStyle blackMediumSize12 = TextStyle(fontSize: 12.0, color: black, fontFamily: poppinsMedium,fontWeight: FontWeight.w600);
TextStyle whiteMediumSize12 = TextStyle(fontSize: 12.0, color: white, fontFamily: poppinsMedium);
TextStyle whiteMediumSize10 = TextStyle(fontSize: 10.0, color: white, fontFamily: poppinsMedium);
TextStyle blackMediumSize14 = TextStyle(fontSize: 14.0, color: black, fontFamily: poppinsMedium);
TextStyle blackSize12 = TextStyle(fontSize: 12.0, color: black, fontFamily: poppinsRegular);
TextStyle whiteSemiBoldSize12 = TextStyle(fontSize: 12.0, color: white, fontFamily: poppinsSemiBold);
