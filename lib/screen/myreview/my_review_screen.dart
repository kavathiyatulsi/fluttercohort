import 'package:cohort_app/common/SizeBoxView.dart';
import 'package:cohort_app/screen/packages/widget/PackagesView.dart';
import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/string.dart';
import 'package:cohort_app/theme/style.dart';
import 'package:cohort_app/widget/Toolbar.dart';

import 'package:flutter/material.dart';

class MyReviewScreen extends StatefulWidget {
  @override
  _MyReviewScreenState createState() => _MyReviewScreenState();
}

class _MyReviewScreenState extends State<MyReviewScreen> {
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
              myReview,
              style: Theme.of(context).textTheme.body1.apply(color: black),
            ),
          ),
          sizeBox(10.0),
          _myReviewList()
        ],
      ),
    );
  }

  Widget _myReviewList() {
    return Expanded(
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 9,
              itemBuilder: (BuildContext context, int index) {
                return getRow(index);
              })),
    );
  }

  Widget getRow(int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 0,
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundImage: AssetImage(index%2==0?profile:dubai),
                  backgroundColor: transparent,
                ),
              ),
              Expanded(
                flex: 8,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Hotel The Comfort Inn ',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: blackMediumSize12,
                      ),
                      sizeBox(5),
                      starWidget(3),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '14-02-2020',
                    style: grayRegularSize10,
                  ),
                ),
              )
            ],
          ),
          Container(
              margin: EdgeInsets.only(left: 50.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'test test teste teste testet testetstest teste testet steste test teste testet teste tteste testetestetes testet',
                    style: grayRegularSize10,
                  ),
                  sizeBox(10.0),
                  index % 3 == 0 ? addTag(true) : addTag(false),
                  sizeBox(12.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 0.2,
                    child: Container(
                      color: gray,
                    ),
                  ),
                ],
              )),

        ],
      ),
    );
  }

  Widget starWidget(int value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          Icons.star,
          size: 15.0,
          color: index < value ? blue : gray,
        );
      }),
    );
  }

  Widget addTag(bool isTagAdd) {
    return isTagAdd
        ? Row(
          children: <Widget>[
            gridItem(everything),
            SizedBox(width: 5.0,),
            gridItem(staff),
            SizedBox(width: 5.0,),
            gridItem(service)
          ],
        )
        : Container();
  }

  Widget gridItem(String tag) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(colors: <Color>[blue, blue, lightBlue]),
          color: blue),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 8.0, right: 8.0, top: 5.0, bottom: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              tag,
              style: whiteMediumSize10,
            ),
          ],
        ),
      ),
    );
  }
}
