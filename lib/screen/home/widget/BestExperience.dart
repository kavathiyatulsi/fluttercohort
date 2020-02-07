import 'package:cohort_app/common/SizeBoxView.dart';
import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/string.dart';
import 'package:cohort_app/widget/RaisedGradientButton.dart';
import 'package:flutter/material.dart';

import 'PackageView.dart';

class BestExperience extends StatefulWidget {
  @override
  _BestExperienceState createState() => _BestExperienceState();
}

class _BestExperienceState extends State<BestExperience> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5.0),
                  topLeft: Radius.circular(5.0)),
              image: new DecorationImage(
                  image: new AssetImage(dubai), fit: BoxFit.cover),
            ),
            child: Center(
              child: Image.asset(iconPlay),
            ),
          ),
          sizeBox(15.0),
          Center(
            child: Text(monuments,
                style: TextStyle(
                    fontSize: 22.0,
                    fontFamily: poppinsSemiBold,
                    color: black,
                    letterSpacing: 1.1)),
          ),
          sizeBox(10.0),
          Center(
            child: Text(quickJourney,
                style: TextStyle(
                    fontSize: 16.0,
                    color: gray,
                    fontFamily: poppinsRegular,
                    )),
          ),
          sizeBox(15.0),
          RaisedGradientButton(
            child: Text(
              viewTripDetails,
              style: TextStyle(fontSize:16.0,fontFamily: poppinsMedium),
            ),
            gradient: LinearGradient(colors: <Color>[blue, blue, lightBlue]),
          )
        ],
      ),
    );
  }
}
