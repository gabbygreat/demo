import 'package:flutter/material.dart';

class MyFolder extends StatelessWidget {
  const MyFolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 200,
        width: 200,
        child: Stack(
          children: [
            SizedBox.expand(
              child: CustomPaint(
                painter: MyFolderPainter(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyFolderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    paint.color = Colors.blue;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 1;

    double boxHeight = 150;
    double offsetHeight = 20;
    double curve = 20;

    path.moveTo(0, curve);
    path.lineTo(0, boxHeight - curve);
    path.quadraticBezierTo(0, boxHeight, curve, boxHeight);
    path.lineTo(size.width - curve, boxHeight);
    path.quadraticBezierTo(
        size.width, boxHeight, size.width, boxHeight - curve);
    path.lineTo(size.width, offsetHeight + curve);
    path.quadraticBezierTo(
        size.width, offsetHeight, size.width - curve, offsetHeight);
    path.lineTo(size.width * 0.6 + curve / 4, offsetHeight);

    path.quadraticBezierTo(size.width * 0.6 - curve, offsetHeight,
        size.width * 0.6 - (curve * 1.5), offsetHeight - (curve / 2));
    path.quadraticBezierTo(
        size.width * 0.6 - (curve * 2), 0, size.width * 0.6 - curve * 2.5, 0);

    path.lineTo(curve, 0);
    path.quadraticBezierTo(0, 0, 0, curve);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
