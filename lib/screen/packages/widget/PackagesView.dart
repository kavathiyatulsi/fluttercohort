import 'package:cohort_app/common/SizeBoxView.dart';
import 'package:cohort_app/screen/details/details_screen.dart';
import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/string.dart';
import 'package:flutter/material.dart';
import 'package:cohort_app/theme/style.dart';

class PackagesView extends StatefulWidget {
  @override
  _PackagesViewState createState() => _PackagesViewState();
}

class _PackagesViewState extends State<PackagesView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return getRow(index);
              })),
    );
  }

  Widget getRow(int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => DetailScreen("$index")));
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),
              margin: EdgeInsets.only(left: 30.0, right: 15),
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3.0,
                        offset: Offset(1.0, 1.0)),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 85.0),
                child: Row(
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Palm Jumeirah',
                              style: blackMediumSize16,
                            ),
                            SizedBox(
                              width: 70.0,
                            ),
                            Text(
                              "\$200.0",
                              style: blackMediumSize16,
                            ),
                          ],
                        ),
                        sizeBox(5),
                        Text(
                          'Aquaventure Water park',
                          style: grayRegularSize10,
                        ),
                        Row(
                          children: <Widget>[
                            getIcon(Icons.hotel),
                            getIcon(Icons.restaurant),
                            getIcon(Icons.flight),
                            getIcon(Icons.business),
                            SizedBox(
                              width: 60.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.0),
                                    ),
                                    border:
                                        Border.all(color: blue, width: 1.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    '4 Night',
                                    style:
                                        TextStyle(fontSize: 12.0, color: blue),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Hero(
              tag: "$index",
              child: Container(
                margin: EdgeInsets.only(left: 15),
                width: 100.0,
                height: 90.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  image: new DecorationImage(
                      image: AssetImage(brazil), fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Icon(
        icon,
        color: gray,
        size: 20.0,
      ),
    );
  }
}
