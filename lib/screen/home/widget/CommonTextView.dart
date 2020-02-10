import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/string.dart';
import 'package:flutter/material.dart';

class CommonTextView extends StatelessWidget {
  String title;

  CommonTextView(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .display2
                  .apply(color: black, fontFamily: poppinsMedium)),
          Text(viewAll,
              style: Theme.of(context).textTheme.display3.apply(color: blue)),
        ],
      ),
    );
  }
}
