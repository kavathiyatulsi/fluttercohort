import 'package:cohort_app/common/SizeBoxView.dart';
import 'package:cohort_app/screen/home/widget/CommonTextView.dart';
import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/string.dart';
import 'package:cohort_app/theme/style.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class OfferAndDetailsScreen extends StatefulWidget {
  @override
  _OfferAndDetailsScreenState createState() => _OfferAndDetailsScreenState();
}

class _OfferAndDetailsScreenState extends State<OfferAndDetailsScreen> {
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                allOfferDeals,
                style: Theme.of(context).textTheme.body1.apply(color: black),
              ),
            ),
            sizeBox(5.0),
            _allOfferList(),
            sizeBox(5.0),
            CommonTextView(special),
            sizeBox(5.0),
            _specialView(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(exclusive,
                  style: Theme.of(context)
                      .textTheme
                      .display2
                      .apply(color: black, fontFamily: poppinsMedium)),
            ),
            _exclusiveView()
          ],
        ),
      ),
    );
  }

  Widget _allOfferList() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 210.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 9,
            itemBuilder: (BuildContext context, int index) {
              return getRow(index);
            }));
  }

  Widget getRow(int index) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(right: 10, left: 10, top: 2, bottom: 2),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 210.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                image: new DecorationImage(
                    image: new AssetImage(dubai), fit: BoxFit.cover),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 40.0,
                    right: 15.0,
                    bottom: 0.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        sizeBox(5.0),
                        Text(
                          'Himaliya'.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .display2
                              .apply(color: white),
                        ),
                        sizeBox(5.0),
                        Text(
                          'Flat 20% Off'.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .body1
                              .apply(color: white),
                        ),
                        sizeBox(5.0),
                        Text(
                          'Cycleing Exprience',
                          style: whiteMediumSize12,
                        ),
                        sizeBox(5.0),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
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
                          padding: EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Valid till December 31',
                                style: TextStyle(
                                    fontSize: 10.0,
                                    color: white,
                                    fontFamily: poppinsMedium),
                              ),
                              Container(
                                padding: EdgeInsets.all(5.0),
                                margin: EdgeInsets.only(right: 5.0),
                                decoration: BoxDecoration(
                                    color: black.withOpacity(0.4),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.0),
                                    )),
                                child: Text(
                                  'View More',
                                  style: TextStyle(
                                      fontSize: 10.0,
                                      color: white,
                                      fontFamily: poppinsMedium),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget _specialView() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        children: <Widget>[
          getSpecialItemView(blue, Icons.hotel, 'Hotel bookings'),
          SizedBox(
            width: 15,
          ),
          getSpecialItemView(
              veryLightBlue, Icons.directions_boat, 'Cruise and Travel'),
        ],
      ),
    );
  }

  Widget getSpecialItemView(Color boxColor, IconData hotel, String dec) {
    return Container(
      height: 170.0,
      width: (MediaQuery.of(context).size.width / 2) - 35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: boxColor.withOpacity(0.1),
          border: Border.all(width: 1, color: boxColor)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              hotel,
              size: 25.0,
              color: boxColor,
            ),
            sizeBox(5.0),
            Text(
              'UPTO \$1000 OFF',
              style: Theme.of(context).textTheme.body2.apply(color: black),
            ),
            sizeBox(5.0),
            Text(
              dec,
              style: blackMediumSize12,
            ),
            sizeBox(20.0),
            Text(
              'CODE',
              style: blackMediumSize12,
            ),
            sizeBox(8.0),
            DottedBorder(
              dashPattern: [9, 5],
              color: boxColor,
              child: Container(
                padding: EdgeInsets.all(5),
                width: (MediaQuery.of(context).size.width / 2) - 30,
                child: Center(
                    child: Text(
                  'FESTIVAL',
                  style: TextStyle(
                      fontSize: 12,
                      color: boxColor,
                      fontWeight: FontWeight.w600),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }

  _exclusiveView() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Container(
        height: 220,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: white,
        ),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 170.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8.0),
                        topLeft: Radius.circular(8.0)),
                    image: new DecorationImage(
                        image: new AssetImage(exclusiveCard),
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  top: 15.0,
                  left: 15.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'FLAT 20% OFF',
                        style: Theme.of(context)
                            .textTheme
                            .body2
                            .apply(color: black),
                      ),
                      sizeBox(10.0),
                      Text(
                        'Booting Expriences',
                        style: Theme.of(context)
                            .textTheme
                            .display3
                            .apply(color: black),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 15.0,
                  right: 15.0,
                  child: Text(
                    'Validity:31 December',
                    style: blackMediumSize12,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'EXCLUSIVE OFFER',
                    style: TextStyle(
                        fontSize: 14.0, color: black, fontFamily: poppinsMedium),
                  ),
                  DottedBorder(
                    dashPattern: [9, 5],
                    color: blue,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: (MediaQuery.of(context).size.width / 2),
                      child: Center(
                          child: Text(
                            'FESTIVAL',
                            style: TextStyle(
                                fontSize: 12,
                                color: blue,
                                fontWeight: FontWeight.w600),
                          )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
