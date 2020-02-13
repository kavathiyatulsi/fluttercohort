import 'package:cohort_app/common/SizeBoxView.dart';
import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/string.dart';
import 'package:cohort_app/theme/style.dart';
import 'package:cohort_app/widget/RaisedGradientButton.dart';
import 'package:flutter/material.dart';

class AddReviewScreen extends StatefulWidget {
  @override
  _AddReviewScreenState createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
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
              Icons.close,
              color: gray,
            )),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              sizeBox(20.0),
              Text(
                howDoYouLikeBooking,
                style: Theme.of(context).textTheme.body1.apply(color: black),
              ),
              sizeBox(8.0),
              Text(
                'For hotel confor inn Airport road ,Ahmedabad',
                style: grayRegularSize10,
              ),
              sizeBox(20.0),
              reviewStaggeredGridView(),
              sizeBox(40.0),

              Text(
                remarksForUs,
                style: Theme.of(context).textTheme.body2.apply(color: black),
              ),
              sizeBox(8.0),
              Text(
                giveUsRating,
                style: grayRegularSize10,
              ),
              sizeBox(15.0),
              starWidget(3),
              reviewBoxView(),
              Padding(
                padding: EdgeInsets.all(18.0),
                child: RaisedGradientButton(
                  child: Text(
                    submit,
                    style: TextStyle(fontSize: 16.0, fontFamily: poppinsMedium),
                  ),
                  gradient:
                      LinearGradient(colors: <Color>[blue, blue, lightBlue]),
                  /*onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (_) => ThankYouScreen()))*/
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget starWidget(int value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Container(
          margin: EdgeInsets.all(10.0),
          height: 30.0,
          width: 30.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: index < value ? blue : gray),
          child: Icon(
            Icons.star,
            size: 20.0,
            color: white,
          ),
        );
      }),
    );
  }

  Widget reviewBoxView() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 180.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)), color: white),
        child: TextFormField(
            decoration: InputDecoration(labelText: writeFewWords)),
      ),
    );
  }

  Widget reviewStaggeredGridView() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                gridItem(everything, isSelected: true),
                gridItem(staff),
                gridItem(service),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                gridItem(communication),
                gridItem(loveIt),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget gridItem(String tag, {bool isSelected = false}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient:isSelected? LinearGradient(colors: <Color>[blue, blue, lightBlue]):LinearGradient(colors: <Color>[white, white, white]),
          color: isSelected ? blue : white),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 8.0, right: 8.0, top: 5.0, bottom: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              tag,
              style: isSelected ? whiteMediumSize12 : blackMediumSize12,
            ),
            SizedBox(
              width: 8.0,
            ),
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                border: Border.all(width: 1, color: isSelected ? white : blue),
              ),
              child: Icon(
                Icons.add,
                color: isSelected ? white : blue,
                size: 10.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
