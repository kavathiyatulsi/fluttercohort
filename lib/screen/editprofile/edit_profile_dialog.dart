import 'package:cohort_app/common/SizeBoxView.dart';
import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/string.dart';
import 'package:cohort_app/theme/style.dart';
import 'package:cohort_app/widget/RaisedGradientButton.dart';
import 'package:flutter/material.dart';

class EditProfileDialog extends StatefulWidget {
  @override
  _EditProfileDialogState createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<EditProfileDialog> {
  final _nameFocus = FocusNode();
  final _email = FocusNode();
  final _mobile = FocusNode();
  final _address = FocusNode();
  final _basicInfo = FocusNode();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      backgroundColor: white,
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                toolbarView(),
                sizeBox(15.0),
                profileView(),
                sizeBox(15.0),
                Text(
                  about,
                  style: blackMediumSize14,
                ),
                fieldName(),
                sizeBox(15.0),
                fieldEmail(),
                sizeBox(15.0),
                fieldMobile(),
                sizeBox(15.0),
                fieldLocation(),
                sizeBox(15.0),
                fieldBasicInfo(),
                sizeBox(40.0),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RaisedGradientButton(
                    child: Text(
                      save,
                      style:
                          TextStyle(fontSize: 16.0, fontFamily: poppinsMedium),
                    ),
                    gradient:
                        LinearGradient(colors: <Color>[blue, blue, lightBlue]),
                    onPressed: () => Navigator.pop(context),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget toolbarView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Edit Profile',
          style: blackMediumSize16,
        ),
        GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.close,
              color: gray,
            )),
      ],
    );
  }

  profileView() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 25.0,
          backgroundImage: AssetImage(profile),
          backgroundColor: transparent,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "Test Patel",
          style: TextStyle(
              fontSize: 14,
              color: blue,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget fieldName() => StreamBuilder<String>(
        builder: (context, snapshote) => TextField(
          textInputAction: TextInputAction.next,
          focusNode: _nameFocus,
          onSubmitted: (value) {
            FocusScope.of(context).requestFocus(_email);
          },
          keyboardType: TextInputType.emailAddress,
          decoration: inPutDecoration(email, snapshote.error),
        ),
      );

  Widget fieldEmail() => StreamBuilder<String>(
        builder: (context, snapshote) => TextField(
          textInputAction: TextInputAction.next,
          focusNode: _email,
          onSubmitted: (value) {
            FocusScope.of(context).requestFocus(_mobile);
          },
          keyboardType: TextInputType.emailAddress,
          decoration: inPutDecoration(email, snapshote.error),
        ),
      );

  Widget fieldMobile() => StreamBuilder<String>(
        builder: (context, snapshote) => TextField(
          textInputAction: TextInputAction.next,
          focusNode: _mobile,
          onSubmitted: (value) {
            FocusScope.of(context).requestFocus(_address);
          },
          keyboardType: TextInputType.phone,
          decoration: inPutDecoration(mobile, snapshote.error),
        ),
      );

  Widget fieldLocation() => StreamBuilder<String>(
        builder: (context, snapshote) => TextField(
          textInputAction: TextInputAction.next,
          focusNode: _address,
          onSubmitted: (value) {
            FocusScope.of(context).requestFocus(_basicInfo);
          },
          keyboardType: TextInputType.text,
          decoration: inPutDecoration(locationAddress, snapshote.error),
        ),
      );

  Widget fieldBasicInfo() => StreamBuilder<String>(
        builder: (context, snapshote) => TextField(
          textInputAction: TextInputAction.next,
          focusNode: _basicInfo,
          onSubmitted: (value) {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          keyboardType: TextInputType.text,
          decoration: inPutDecoration(basicInfo, snapshote.error),
        ),
      );

  inPutDecoration(String types, Object error) {
    return InputDecoration(
      hintText: types,
      labelText: types,
      fillColor: black,
      errorText: error,
    );
  }
}
