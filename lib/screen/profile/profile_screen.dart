import 'package:cohort_app/common/SizeBoxView.dart';
import 'package:cohort_app/widget/Toolbar.dart';
import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/string.dart';
import 'package:cohort_app/theme/style.dart';
import 'package:cohort_app/widget/ProfileWidget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(myProfile, context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Column(
              children: <Widget>[
                profileView(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 0.2,
                  child: Container(
                    color: gray,
                  ),
                ),
                ProfileView(title: security, subTitle: changePassword, icon: iconPassword),
                ProfileView(
                    title: yourHandPicked,
                    subTitle: favorites,
                    icon: iconFavorites),
                ProfileView(
                    title: allYourReview,
                    subTitle: myReview,
                    icon: iconReviews),
                ProfileView(
                    title: myOffer, subTitle: allOfferDeals, icon: iconOffers),
                ProfileView(subTitle: logOut, icon: iconLogout, isLogin: true,),

                // profileWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }

  profileView() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 0,
            child: CircleAvatar(
              radius: 25.0,
              backgroundImage: AssetImage(brazil),
              backgroundColor: transparent,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                sizeBox(2),
                Text(
                  about,
                  style: profileTextSmall,
                ),
                sizeBox(10),
                Text(
                  "Test Patel",
                  style: profileTextBig,
                )
              ],
            ),
          ),
          Text(
            edit,
            style: TextStyle(fontSize: 10.0, color: blue),
          )
        ],
      ),
    );
  }
}
