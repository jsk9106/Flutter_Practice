import 'dart:ui';

import 'package:flutter/material.dart';

class BlurScreen extends StatelessWidget {
  double x = 20;
  double y = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blur Effect'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: x, sigmaY: y),
              child: CustomPaint(
                painter: MyPainter(
                  offset: Offset(0, 0),
                  radius: 100,
                  color: Colors.greenAccent,
                ),
              ),
            ),
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: x, sigmaY: y),
              child: CustomPaint(
                painter: MyPainter(
                  offset: Offset(100, -100),
                  radius: 50,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// paint 담당 클래스
class MyPainter extends CustomPainter {
  final Offset offset; // 페인트 위치 조절
  final double radius; // 페인트 크기 조절
  final Color color; // 페인트 색

  MyPainter({
    required this.offset,
    required this.radius,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    // circle
    canvas.drawCircle(offset, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
