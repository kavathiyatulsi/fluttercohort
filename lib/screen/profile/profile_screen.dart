import 'package:cohort_app/common/SizeBoxView.dart';
import 'package:cohort_app/screen/changepassword/change_password_dialog.dart';
import 'package:cohort_app/screen/editprofile/edit_profile_dialog.dart';
import 'package:cohort_app/screen/favorites/favorites_screen.dart';
import 'package:cohort_app/screen/myreview/my_review_screen.dart';
import 'package:cohort_app/screen/offersdetails/offers_details_screen.dart';
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
                ProfileView(
                  title: security,
                  subTitle: changePassword,
                  icon: iconPassword,
                  onPressed: () => _openChangePasswordDialog(),
                ),
                ProfileView(
                  title: yourHandPicked,
                  subTitle: favorites,
                  icon: iconFavorites,
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => FavoritesScreen())),
                ),
                ProfileView(
                  title: allYourReview,
                  subTitle: myReview,
                  icon: iconReviews,
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => MyReviewScreen())),
                ),
                ProfileView(
                    title: myOffer,
                    subTitle: allOfferDeals,
                    icon: iconOffers,
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => OfferAndDetailsScreen()))),
                ProfileView(
                  subTitle: logOut,
                  icon: iconLogout,
                  isLogin: true,
                ),

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
          GestureDetector(
            onTap: () {
              openEditDialog();
            },
            child: Text(
              edit,
              style: TextStyle(fontSize: 10.0, color: blue),
            ),
          )
        ],
      ),
    );
  }

  void openEditDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => EditProfileDialog());
  }

  _openChangePasswordDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => ChangePasswordDialog());
  }

  _openAllOfferAndDetails() {
    showDialog(
        context: context,
        builder: (BuildContext context) => ChangePasswordDialog());
  }

  void _openAddEntryDialog() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return EditProfileDialog();
        },
        fullscreenDialog: false));
  }
}
