import 'dart:math';

import 'package:flutter/material.dart';

class ShoeDisplay extends StatefulWidget {
  const ShoeDisplay({Key? key}) : super(key: key);

  @override
  State<ShoeDisplay> createState() => _ShoeDisplayState();
}

class _ShoeDisplayState extends State<ShoeDisplay> {
  double angle = 0;
  changeAngle(String direction) => setState(() {
        if (direction == 'FRONT') {
          angle += 1;
        } else {
          angle -= 1;
        }
      });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 200,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Stack(
          children: [
            Positioned(
              bottom: 10,
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.9,
                child: CustomPaint(
                  painter: OvalArc(),
                ),
              ),
            ),
            Transform(
              transform: Matrix4.rotationY(angle * (pi / 2)),
              alignment: Alignment.center,
              child: Container(
                height: MediaQuery.of(context).size.height - 130,
                alignment: Alignment.center,
                child: Center(
                  child: Image.asset(
                    'assets/shoe.png',
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 25,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black54,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => changeAngle('BACK'),
                      child: const Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => changeAngle('FRONT'),
                      child: const Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OvalArc extends CustomPainter {
  OvalArc();

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Paint paint2 = Paint();

    paint.color = Colors.blue;
    paint2.color = Colors.white;
    paint.style = PaintingStyle.stroke;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 1;

    canvas.drawOval(Rect.fromLTWH(0, 0, size.width, size.height), paint);
    canvas.drawOval(
        Rect.fromLTWH(1.5, -3, size.width - 3, size.height), paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
