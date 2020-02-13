import 'package:cohort_app/common/SizeBoxView.dart';
import 'package:cohort_app/theme/color.dart';
import 'package:cohort_app/theme/string.dart';
import 'package:cohort_app/theme/style.dart';
import 'package:flutter/material.dart';

class SelectedCategory extends StatefulWidget {
  @override
  _SelectedCategoryState createState() => _SelectedCategoryState();
}

class _SelectedCategoryState extends State<SelectedCategory>
    with SingleTickerProviderStateMixin {
  AnimationController _animatedContainer;

  int selectedIndex = 0;

  @override
  void initState() {
    _animatedContainer = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _animatedContainer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 70.0,
          color: white,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryList.length,
              itemBuilder: (BuildContext context, int index) {
                return selectedCategoryList(index);
              }),
        ),
        Category()
      ],
    );
  }

  Widget selectedCategoryList(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Container(
          padding: EdgeInsets.only(right: 10, left: 10, top: 2, bottom: 2),
          decoration: BoxDecoration(
              color: index == selectedIndex ? blue : white,
              gradient:
                  index == selectedIndex ? buttonGradient : buttonGradientWhite,
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          child: Center(
            child: Text(
              categoryList[index],
              style: TextStyle(
                  fontSize: 14.0,
                  color: index == selectedIndex ? white : black),
            ),
          ),
        ),
      ),
    );
  }
}

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210.0,
      width: MediaQuery.of(context).size.width,
      color: white,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return categoryViewList(index);
          }),
    );
  }

  Widget categoryViewList(int index) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            width: MediaQuery.of(context).size.width * 0.8,
            height: 170,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            )),
            child: Image.asset(
              dubai,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          right: 30.0,
          left: 30.0,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10.0,
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'Dubai',
                          style: blackSize12,
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        Icon(
                          Icons.brightness_1,
                          size: 8.0,
                          color: black,
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        Text(
                          '4 Days 3 night',
                          style: blackSize12,
                        ),
                      ],
                    ),
                    sizeBox(5.0),
                    Text(
                      'test test test test test test test ghmbgmh k b g jklgb gmbfb fbmfbfgn bg b kbgkb g b fgbkfgb mbfbk  knk m fn jk ',
                      style: grayRegularSize10,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
