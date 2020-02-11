import 'package:cohort_app/common/SizeBoxView.dart';
import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/string.dart';
import 'package:cohort_app/theme/style.dart';
import 'package:cohort_app/widget/RaisedGradientButton.dart';
import 'package:flutter/material.dart';

class ThankYouScreen extends StatefulWidget {
  @override
  _ThankYouScreenState createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.close,
            color: gray,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: test(),
        ),
      ),
    );
  }

  Widget test() {
  return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        sizeBox(10.0),
        Text(
          thankYou,
          style: Theme.of(context).textTheme.body1.apply(color: black),
        ),
        sizeBox(10.0),
        Text(
          'Dear, George your booking is confirmed',
          style: blackMediumSize12,
        ),
        sizeBox(70.0),
        Image.asset(iconThankYou),
        sizeBox(70.0),
        Text(
          'Just sit back ',
          style: blackMediumSize12,
        ),
        sizeBox(10.0),
        Center(
          child: Text(
            'No need to call us for reconfirm this booking \nYour eTicker is attacted with the email to your email-id',
            textAlign: TextAlign.center,
            style: grayRegularSize10,
          ),
        ),
        sizeBox(40.0),
        Padding(
          padding: EdgeInsets.all(18.0),
          child: RaisedGradientButton(
            child: Text(
              viewDetails,
              style: TextStyle(fontSize: 16.0, fontFamily: poppinsMedium),
            ),
            gradient: LinearGradient(colors: <Color>[blue, blue, lightBlue]),
            /*onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ThankYouScreen()))*/
          ),
        )
      ],
    );
  }
}
