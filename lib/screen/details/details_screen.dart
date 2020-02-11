import 'package:cohort_app/common/SizeBoxView.dart';
import 'package:cohort_app/screen/home/widget/CommonTextView.dart';
import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/string.dart';
import 'package:cohort_app/theme/style.dart';
import 'package:cohort_app/widget/RaisedGradientButton.dart';
import 'package:flutter/material.dart';

import 'facility_view.dart';

class DetailScreen extends StatefulWidget {
  String index;

  DetailScreen(this.index);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: widget.index,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    image: new DecorationImage(
                        image: AssetImage(burjBbg), fit: BoxFit.fill)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: white,
                        ),
                      ),
                      Image.asset(favoriteSolid)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Burj AI Arab',
                          style: Theme.of(context)
                              .textTheme
                              .body1
                              .apply(color: black),
                        ),
                        Text(
                          'Sea view Premium lifestyle',
                          style: grayRegularSize10,
                        ),
                        sizeBox(5),
                        Row(
                          children: <Widget>[
                            starWidget(3),
                            SizedBox(
                              width: 2.0,
                            ),
                            Text(
                              'Score 4.0',
                              style: grayRegularSize10,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            dotWidget(),
                            Text(
                              '1028',
                              style: grayRegularSize10,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                          color: blue),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 3, bottom: 3),
                        child: Text(
                          '4 Night',
                          style: TextStyle(fontSize: 12.0, color: white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            FacilitesView(),
            Padding(
              padding: EdgeInsets.only(left: 18.0, top: 10),
              child: Text(
                overview,
                style: blackMediumSize16,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 18.0, top: 8),
              child: Text(
                "test teste testse  teste test test tests test test test\n test test test test test test\n test test test test",
                style: blackRegularSize10,
              ),
            ),
            videoView(),
            sizeBox(10.0),
            CommonTextView(whoGoing),
            goingView(),
            getSimpleText(inclusion),
            getListOfInfo(),
            getSimpleText(exclusions),
            getListOfInfo(),
            getSimpleText('About Burj AI Arab'),
            aboutView(),
            sizeBox(10),
            Padding(
              padding: EdgeInsets.all(18.0),
              child: RaisedGradientButton(
                child: Text(
                  continueBooking,
                  style: TextStyle(fontSize: 16.0, fontFamily: poppinsMedium),
                ),
                gradient:
                    LinearGradient(colors: <Color>[blue, blue, lightBlue]),
              ),
            )
          ],
        ),
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

  Widget dotWidget() {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        width: 20.0,
        height: 12.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 0.3, color: gray)),
        child: Center(
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 5,
              ),
              getDotIcon(),
              SizedBox(
                width: 0.2,
              ),
              getDotIcon(),
              SizedBox(
                width: 0.20,
              ),
              getDotIcon(),
            ],
          ),
        ),
      ),
    );
  }

  Widget getDotIcon({double size = 1.0, Color color = Colors.grey}) {
    return Padding(
      padding: EdgeInsets.all(1.0),
      child: Icon(
        Icons.brightness_1,
        size: size,
        color: color,
      ),
    );
  }

  Widget videoView() {
    return Padding(
      padding: EdgeInsets.only(left: 18.0, top: 8, right: 18.0),
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              image: new DecorationImage(
                  image: new AssetImage(burjBbg), fit: BoxFit.cover),
            ),
            child: Center(
              child: Image.asset(iconPlay),
            ),
          ),
          Positioned(
            right: 12.0,
            top: 12.0,
            child: Container(
              padding:
                  EdgeInsets.only(top: 2.0, bottom: 2.0, left: 4.0, right: 4.0),
              color: red,
              child: Text(
                'Dubia'.toUpperCase(),
                style: TextStyle(fontSize: 8.0, color: white),
              ),
            ),
          ),
          Positioned(
            right: 12.0,
            bottom: 12.0,
            child: Container(
              padding:
                  EdgeInsets.only(top: 2.0, bottom: 2.0, left: 4.0, right: 4.0),
              child: Row(
                children: <Widget>[
                  getDotIcon(size: 4, color: white),
                  SizedBox(
                    width: 0.4,
                  ),
                  getDotIcon(size: 4, color: white),
                  SizedBox(
                    width: 0.4,
                  ),
                  getDotIcon(size: 4, color: white)
                ],
              ),
            ),
          ),
          Positioned(
            left: 12.0,
            bottom: 12.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Plam Jumeriah'.toUpperCase(),
                  style: Theme.of(context).textTheme.body1.apply(color: white),
                ),
                Text(
                  'Burj al arab dubai',
                  style: whiteRegularSize10,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget goingView() {
    return Padding(
      padding: padding,
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.32,
                color: red,
              ),
              circleProfile(),
              Positioned(
                left: 28.0,
                child: circleProfile(),
              ),
              Positioned(
                left: 56,
                child: circleProfile(),
              ),
              Positioned(
                left: 84,
                child: circleProfile(),
              )
            ],
          ),
          Text(
            'And 58+ Pepole registered',
            style: grayRegularSize10,
          )
        ],
      ),
    );
  }

  Widget circleProfile() {
    return Container(
      width: 35,
      height: 35.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(24.0),
          ),
          color: white),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: CircleAvatar(
          radius: 15.0,
          backgroundImage: AssetImage(profile),
          backgroundColor: transparent,
        ),
      ),
    );
  }

  Widget getSimpleText(String title) {
    return Padding(
      padding: padding,
      child: Text(
        title,
        style: Theme.of(context).textTheme.display1.apply(color: black),
      ),
    );
  }

  Widget getListOfInfo() {
    return Padding(
      padding: EdgeInsets.only(left: 18),
      child: Container(
          decoration: BoxDecoration(color: white),
          child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return getRow(index);
              })),
    );
  }

  Widget getRow(int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.done,
          size: 20.0,
          color: gray,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          'Accommodation at mention',
          style: blackRegularSize10,
        )
      ],
    );
  }

  Widget aboutView() {
    return Padding(
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              image: new DecorationImage(
                  image: new AssetImage(dubai), fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: RichText(
              maxLines: 5,
              text: TextSpan(
                  text: 'test test test test test test test test teste test\n'
                      'test test test test test test test test test test '
                      '\ntest test test test test test test test test test'
                      '\ntest test test test test test test ',
                  style: blackRegularSize10,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Read more',
                        style: TextStyle(fontSize: 10, color: blue))
                  ]),
            ),
          )
        ],
      ),
    );
  }

  EdgeInsets padding = EdgeInsets.only(left: 18.0, top: 5, right: 18.0);
}

