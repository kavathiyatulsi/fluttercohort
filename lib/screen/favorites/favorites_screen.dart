import 'package:cohort_app/common/SizeBoxView.dart';
import 'package:cohort_app/screen/packages/widget/PackagesView.dart';
import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/string.dart';
import 'package:cohort_app/widget/Toolbar.dart';

import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: gray,
            )),
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              favorites,
              style: Theme.of(context).textTheme.body1.apply(color: black),
            ),
          ),
          sizeBox(10.0),
          PackagesView()
        ],
      ),
    );
  }
}
