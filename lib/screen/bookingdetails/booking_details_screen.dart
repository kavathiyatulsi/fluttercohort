import 'package:cohort_app/theme/style.dart';
import 'package:cohort_app/widget/RaisedGradientButton.dart';
import 'package:flutter/material.dart';
import 'package:cohort_app/common/SizeBoxView.dart';
import 'package:cohort_app/screen/packages/widget/PackagesView.dart';
import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/string.dart';

class BookingDetailsScreen extends StatefulWidget {
  @override
  _BookingDetailsScreenState createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
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
                bookingDetails,
                style: Theme.of(context).textTheme.body1.apply(color: black),
              ),
            ),
            sizeBox(10.0),
            bookingIdView(),
            hotelView(),
            divider(),
            sizeBox(10),
            getListTile("Check In 10:00 AM ", '20 Oct 20', 'Check Out 10:00 AM',
                '22 oct 20'),
            divider(),
            sizeBox(10),
            getListTile("Room Types", 'AC ROOM', 'ROOMS', '1 ROOM'),
            divider(),
            sizeBox(10),
            getListTile(
                "Guest(2 Adults)", 'Richard George', 'Amount(Paid)', '\$200'),
            divider(),
            sizeBox(10),
            googleMapView(),
            Padding(
              padding: EdgeInsets.all(18.0),
              child: RaisedGradientButton(
                child: Text(
                  callHotel,
                  style: TextStyle(fontSize: 16.0, fontFamily: poppinsMedium),
                ),
                gradient:
                    LinearGradient(colors: <Color>[blue, blue, lightBlue]),
                /*onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ThankYouScreen()))*/
              ),
            )
            //PackagesView()
          ],
        ),
      ),
    );
  }

  Widget divider() {
    return Padding(
      padding: EdgeInsets.only(left: 18.0, right: 18.0, top: 20.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 0.2,
        child: Container(
          color: gray,
        ),
      ),
    );
  }

  Widget bookingIdView() {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: blue,
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
          gradient: LinearGradient(colors: <Color>[blue, blue, lightBlue])),
      child: Padding(
        padding: const EdgeInsets.only(right: 6, left: 6, top: 5, bottom: 5),
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
                'Give Review',
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
    );
  }

  Widget hotelView() {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Padding(
              padding: EdgeInsets.only(left: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Hotel The Comfort Inn',
                    style:
                        Theme.of(context).textTheme.body2.apply(color: black),
                  ),
                  sizeBox(10.0),
                  Text(
                    'Airpot road ahemdabad',
                    style: grayRegularSize10,
                  ),
                  sizeBox(10.0),
                  Text(
                    'Inclusion:Accommodetion',
                    style: blackMediumSize12,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(right: 18.0),
              child: Container(
                  margin: EdgeInsets.only(left: 15),
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    image: new DecorationImage(
                        image: AssetImage(dubai), fit: BoxFit.cover),
                  )),
            ),
          )
        ],
      ),
    );
  }

  Widget checkInOutView() {
    return ListView(
      children: <Widget>[
        getListTile("Check In 10:00 AM ", '20 Oct 20', 'Check Out 10:00 AM',
            '22 oct 20')
      ],
    );
  }

  Widget getListTile(
      String titleOne, String decOne, String titleTwo, String decTwo) {
    return Padding(
      padding: EdgeInsets.only(left: 18.0, right: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                titleOne,
                style: grayRegularSize10,
              ),
              sizeBox(12),
              Text(
                decOne,
                style: blackMediumSize14,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                titleTwo,
                style: grayRegularSize10,
              ),
              sizeBox(12),
              Text(
                decTwo,
                style: blackMediumSize14,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget googleMapView() {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              margin: EdgeInsets.only(left: 15),
              width: MediaQuery.of(context).size.width,
              height: 180.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                image: new DecorationImage(
                    image: AssetImage(dubai), fit: BoxFit.cover),
              )),
        ),
        Positioned(
          bottom: 15.0,
          right: 15.0,
          child: Container(
            decoration: BoxDecoration(
              color: black.withOpacity(0.5),
              borderRadius: BorderRadius.all(Radius.circular(2.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                viewInGoogleMap,
                style: whiteSemiBoldSize12,
              ),
            ),
          ),
        )
      ],
    );
  }
}
