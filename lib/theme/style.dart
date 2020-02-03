import 'package:cohort_app/theme/string.dart';
import 'package:flutter/material.dart';

import 'color.dart';

ThemeData themeData = ThemeData(
    primaryColor: black,
    accentColor: white,
    fontFamily: poppins,
    textTheme: TextTheme(
      body1:
          TextStyle(fontSize: 16.0, color: white, fontFamily:poppinsSemiBold,fontWeight: FontWeight.w600),
      body2:
          TextStyle(fontSize: 16.0, color: white,fontFamily:poppinsMedium, fontWeight: FontWeight.w600),
    ));
