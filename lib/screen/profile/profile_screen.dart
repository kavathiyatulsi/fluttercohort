import 'package:cohort_app/theme/color.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            'Profile',
            style: TextStyle(fontSize: 20.0, color: red),
          ),
        ),
      ),
    );
  }
}
