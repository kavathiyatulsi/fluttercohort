import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  Color colorOne = Colors.red;
  Color colorTwo = Colors.red[300];
  Color colorThree = Colors.red[100];

  CurvePainter(this.colorOne);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    final height = size.height;
    final width = size.width;

    paint.color = Colors.blue;
    canvas.drawPath(path, paint);
    path = Path();
    path.lineTo(width * 0.3, 0);
    path.quadraticBezierTo(width * 0.40, height * 0.51, width * 0.65, height * 0.40);
    //path.quadraticBezierTo(size.width * 0.60, size.height * 0.30, size.width * 0.40, size.height * 0.65);
    //path.quadraticBezierTo(size.width * 0.50, size.height * 0.30, size.width * 0.72, size.height * 0.69);
    path.quadraticBezierTo(width * 0.90, height * 0.70, width, height * 0.60);
    path.lineTo(size.width, 0);
    path.close();

    paint.color = colorOne.withOpacity(0.1);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
