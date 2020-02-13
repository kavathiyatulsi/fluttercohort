import 'package:cohort_app/common/SizeBoxView.dart';
import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/string.dart';
import 'package:cohort_app/theme/style.dart';
import 'package:cohort_app/widget/RaisedGradientButton.dart';
import 'package:flutter/material.dart';

class ChangePasswordDialog extends StatefulWidget {
  @override
  _ChangePasswordDialogState createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
  final _nameFocus = FocusNode();
  final _email = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      backgroundColor: white,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  toolbarView(),
                  sizeBox(15.0),
                  fieldName(),
                  sizeBox(15.0),
                  fieldEmail(),
                  sizeBox(15.0),
                  sizeBox(40.0),
                ],
              ),
              Positioned(
                bottom: 30.0,
                right: 0.0,
                left: 0.0,
                child: RaisedGradientButton(
                  child: Text(
                    update,
                    style: TextStyle(fontSize: 16.0, fontFamily: poppinsMedium),
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
    );
  }

  Widget toolbarView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          changePassword,
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

  Widget fieldName() => StreamBuilder<String>(
        builder: (context, snapshote) => TextField(
          textInputAction: TextInputAction.next,
          focusNode: _nameFocus,
          onSubmitted: (value) {
            FocusScope.of(context).requestFocus(_email);
          },
          keyboardType: TextInputType.visiblePassword,
          decoration: inPutDecoration(enterOldPassword, snapshote.error),
        ),
      );

  Widget fieldEmail() => StreamBuilder<String>(
        builder: (context, snapshote) => TextField(
          textInputAction: TextInputAction.next,
          focusNode: _email,
          onSubmitted: (value) {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          keyboardType: TextInputType.visiblePassword,
          decoration: inPutDecoration(setNewPassword, snapshote.error),
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
