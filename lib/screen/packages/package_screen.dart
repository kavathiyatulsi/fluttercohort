import 'package:cohort_app/common/SizeBoxView.dart';
import 'package:cohort_app/screen/home/widget/CommonTextView.dart';
import 'package:cohort_app/screen/packages/widget/PackagesView.dart';
import 'package:cohort_app/screen/packages/widget/SelectedCategory.dart';
import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/string.dart';
import 'package:flutter/material.dart';

class PackageScreen extends StatefulWidget {
  @override
  _PackageScreenState createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: gray,)),
        elevation: 0.0,
      ),
      body: Column(
      children: <Widget>[
        SelectedCategory(),
        sizeBox(8),
        CommonTextView(packages),
        sizeBox(8),
        PackagesView()

      ],
      ),
    );
  }
}
