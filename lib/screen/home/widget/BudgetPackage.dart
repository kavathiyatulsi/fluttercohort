import 'package:cohort_app/common/SizeBoxView.dart';
import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/string.dart';
import 'package:flutter/material.dart';

import 'PackageView.dart';

class BudgetPackage extends StatefulWidget {
  @override
  _BudgetPackageState createState() => _BudgetPackageState();
}

class _BudgetPackageState extends State<BudgetPackage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: <Widget>[PackageView(budgetPackages),
          sizeBox(15),
          popularPackageList()],
      ),
    );
  }

  Widget popularPackageList() {
    return Container(
      height: 110.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return getRow(index);
          }),
    );
  }

  Widget getRow(int index) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      width: 110.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        image: new DecorationImage(
            image: new AssetImage(index % 2 == 0 ? brazil : dubai),
            fit: BoxFit.cover),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0.0,
            child: Align(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(6.0),
                        bottomRight: Radius.circular(6.0))),
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: Center(
                    child: Text(
                      'Dubai',
                      style: TextStyle(
                          fontSize: 12.0,
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
    );
  }
}
