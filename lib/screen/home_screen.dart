import 'package:cohort_app/theme/color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title: Center(
          child: Text(
            'Home',
            style: Theme.of(context).textTheme.body1.apply(color: white),
          ),
        ),
      ),
    );
  }
}
