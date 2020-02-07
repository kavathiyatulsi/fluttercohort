import 'package:cohort_app/theme/color.dart';
import 'package:flutter/material.dart';

Widget myAppBar(String title, BuildContext context) {
  return AppBar(
    backgroundColor: white,
    title: Text(
      title,
      style: Theme.of(context).textTheme.body1.apply(color: black),
    ),
    elevation: 0.0,
  );
}
