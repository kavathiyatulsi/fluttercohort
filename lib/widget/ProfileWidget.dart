import 'package:cohort_app/common/SizeBoxView.dart';
import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/style.dart';
import 'package:flutter/material.dart';

import 'CustomSwitch.dart';

class ProfileView extends StatefulWidget {
  String title;
  String subTitle;
  String icon;
  bool isSwitchVisible=false;
  bool isLogin=false;

  ProfileView({Key key, this.title, this.subTitle, this.icon, this.isSwitchVisible=false,this.isLogin=false})
      : super(key: key);

  //CustomSwitch({Key key, this.value, this.onChanged}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 0,
                child: Image.asset(
                  widget.icon,
                  color: blue,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    sizeBox(2),
                    !widget.isLogin ? Text(
                      widget.title,
                      style: profileTextSmall,
                    ):SizedBox(
                      width: 0.0,
                    ),
                    sizeBox(10),
                    Text(
                      widget.subTitle,
                      style: profileTextBig,
                    )
                  ],
                ),
              ),
              widget.isSwitchVisible
                  ? Expanded(
                      flex: 0,
                      child: CustomSwitch(
                        value: isSwitched,
                        onChanged: (bool val) {
                          setState(() {
                            isSwitched = val;
                          });
                        },
                      ),
                    )
                  : SizedBox(
                width: 0.0,
              )
            ],
          ),
          sizeBox(10.0),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 0.2,
            child: Container(
              color: gray,
            ),
          ),
        ],
      ),
    );
    ;
  }
}
