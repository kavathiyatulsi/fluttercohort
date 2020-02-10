import 'package:cohort_app/common/SizeBoxView.dart';
import 'package:cohort_app/screen/packages/package_screen.dart';
import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/string.dart';
import 'package:flutter/material.dart';

import 'CommonTextView.dart';

class PopularPackage extends StatefulWidget {
  @override
  _PopularPackageState createState() => _PopularPackageState();
}

class _PopularPackageState extends State<PopularPackage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: <Widget>[CommonTextView(popularPackages), popularPackageList()],
      ),
    );
  }

  Widget popularPackageList() {
    return Container(
      height: 200.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return getRow(index);
          }),
    );
  }

  Widget getRow(int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => PackageScreen()));
      },
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Container(
            width: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              image: new DecorationImage(
                  image: new AssetImage(popularBg), fit: BoxFit.cover),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 40.0,
                  right: 0.0,
                  left: 0.0,
                  bottom: 0.0,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                            top: 2.0, bottom: 2.0, left: 4.0, right: 4.0),
                        color: red,
                        child: Text(
                          'italy'.toUpperCase(),
                          style: TextStyle(fontSize: 8.0, color: white),
                        ),
                      ),
                      sizeBox(5.0),
                      Text(
                        'Burana\nisland'.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .body2
                            .apply(color: white),
                      ),
                      sizeBox(5.0),
                      Text(
                        'November 2019'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 9.0,
                            color: white,
                            fontFamily: poppinsMedium),
                      ),
                      sizeBox(5.0),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 9.0,
                  right: 0,
                  left: 0,
                  child: Align(
                    child: Container(
                      decoration: BoxDecoration(
                          color: blue,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5.0),
                              bottomRight: Radius.circular(5.0))),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            viewTrip,
                            style: TextStyle(
                                fontSize: 10.0,
                                color: white,
                                fontFamily: poppinsMedium),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
