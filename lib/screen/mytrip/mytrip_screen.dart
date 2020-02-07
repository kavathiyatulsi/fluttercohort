import 'package:cohort_app/common/SizeBoxView.dart';
import 'package:cohort_app/widget/Toolbar.dart';
import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/string.dart';
import 'package:cohort_app/theme/style.dart';
import 'package:flutter/material.dart';

class MyTripScreen extends StatefulWidget {
  @override
  _MyTripScreenState createState() => _MyTripScreenState();
}

class _MyTripScreenState extends State<MyTripScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(myTrips, context),
      body: SafeArea(
        child: myTripList(),
      ),
    );
  }

  Widget myTripList() {
    return Container(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return getRow(index);
          }),
    );
  }

  Widget getRow(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Image.asset(index % 2 == 0 ? hotel : rowing),
                  flex: 1,
                ),
                Expanded(
                  flex: 10,
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: blue,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        gradient: LinearGradient(
                            colors: <Color>[blue, blue, lightBlue])),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 6, left: 6, top: 5, bottom: 5),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              'Booking ID:223232',
                              style: textSize10,
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: Text(
                              'viewDetails',
                              style: textSize10,
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: Image.asset(
                              iconArrowNext,
                              height: 12,
                              width: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '19 Oct - 23 Oct',
                    style:
                        Theme.of(context).textTheme.body2.apply(color: black),
                  ),
                  sizeBox(5),
                  Text(
                    'Hotel The Comfort In Ahemdabad',
                    style: TextStyle(fontSize: 10.0, color: gray),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 6, left: 0, top: 5, bottom: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.brightness_1,
                          size: 8.0,
                          color: black,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Stayed',
                            style: TextStyle(fontSize: 13.0, color: black),
                          ),
                        ),
                        Expanded(
                          flex: 0,
                          child: Text(
                            giveReview,
                            style: TextStyle(fontSize: 13.0, color: blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                  sizeBox(5),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 0.2,
                    child: Container(
                      color: gray,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
