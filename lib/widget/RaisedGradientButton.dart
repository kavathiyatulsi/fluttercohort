import 'package:flutter/material.dart';

class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final Function onPressed;
  final bool isEnable;

  const RaisedGradientButton({Key key,
    @required this.child,
    this.gradient=grad,
    this.width = double.infinity,
    this.height = 50.0,
    this.onPressed,
    this.isEnable = true})
      : super(key: key);
  static const grad = LinearGradient(
      begin: Alignment(1, 0),
      end: Alignment(0, 1),
      colors: [const Color(0xffffaf3c), const Color(0xffff771c)]);

  static const disableGrad = LinearGradient(
      begin: Alignment(1, 1),
      end: Alignment(1, 1),
      colors: [const Color(0xFFA3A3A3), const Color(0xFFA3A3A3)]);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
          gradient: isEnable == true ? gradient : disableGrad,
          boxShadow: [BoxShadow(color: Colors.grey[500], blurRadius: 1.5)]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}

