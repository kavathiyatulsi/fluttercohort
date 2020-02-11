import 'package:cohort_app/common/SizeBoxView.dart';
import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/string.dart';
import 'package:cohort_app/theme/style.dart';
import 'package:flutter/material.dart';

class FacilitesView extends StatefulWidget {
  @override
  _FacilitesViewState createState() => _FacilitesViewState();
}

class _FacilitesViewState extends State<FacilitesView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3.0,
                  offset: Offset(1.0, 1.0)),
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            getFacilityColumn(Icons.flight, flight),
            getFacilityColumn(Icons.restaurant, meals),
            getFacilityColumn(Icons.hotel, hotel),
            getFacilityColumn(Icons.business, siteView),
            getFacilityColumn(Icons.directions_car, transfer),
          ],
        ),
      ),
    );
  }

  Widget getFacilityColumn(IconData icon, String facilityName) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: blue,
          size: 30.0,
        ),
        sizeBox(10.0),
        Text(
          facilityName,
          style: grayRegularSize10,
        )
      ],
    );
  }
}
