import 'package:cohort_app/widget/Toolbar.dart';
import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/string.dart';
import 'package:cohort_app/widget/ProfileWidget.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(setting, context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Column(
              children: <Widget>[
                ProfileView(title: getUpdate, subTitle: notification, icon: iconNotification, isSwitchVisible: true),
                ProfileView(title: needHelp, subTitle: help, icon: iconHelp),
                ProfileView(title: queAns, subTitle: faq, icon: iconFaq),
                ProfileView(
                    title: privacyPolicy, subTitle: privacy, icon: iconPrivacy),
                ProfileView(title: aboutApp, subTitle: version, icon: iconApp),

                // profileWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
