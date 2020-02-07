import 'package:cohort_app/theme/color.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            'Setting',
            style: TextStyle(fontSize: 20.0, color: blue),
          ),
        ),
      ),
    );
  }
}
