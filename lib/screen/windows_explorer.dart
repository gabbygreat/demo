import 'package:flutter/material.dart';

class WindowsExplorer extends StatefulWidget {
  const WindowsExplorer({Key? key}) : super(key: key);

  @override
  State<WindowsExplorer> createState() => _WindowsExplorerState();
}

class _WindowsExplorerState extends State<WindowsExplorer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 200,
        width: 180,
        child: CustomPaint(
          painter: FolderPainter(),
        ),
      ),
    );
  }
}

class FolderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Paint paint1 = Paint();
    Paint paint2 = Paint();

    Path path = Path();
    Path path1 = Path();
    Path path2 = Path();

    paint.color = Colors.yellow.shade600;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 1;

    paint1.color = Colors.yellow.shade800;
    paint1.style = PaintingStyle.fill;
    paint1.strokeWidth = 1;

    paint2.color = Colors.blue;
    paint2.style = PaintingStyle.stroke;
    paint2.strokeWidth = 30;
    paint2.strokeCap = StrokeCap.round;

    double boxHeight = 150;
    double offsetHeight = 20;
    double curve = 15;

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

    path1.moveTo(0, offsetHeight * 1.2);
    path1.lineTo(size.width * 0.6 - curve * 2.5, offsetHeight * 1.2);
    path1.lineTo(size.width * 0.6 - curve * 2.5, offsetHeight * 1.2);
    path1.quadraticBezierTo(
        size.width * 0.6 - curve * 2.5 + (offsetHeight * 1.2),
        offsetHeight * 1.2,
        size.width * 0.6 - curve * 2.5 + curve,
        (offsetHeight) / 2);
    path1.quadraticBezierTo(
        size.width * 0.6 - curve * 2, 0, size.width * 0.6 - curve * 2.5, 0);
    path1.lineTo(curve, 0);
    path1.quadraticBezierTo(0, 0, 0, curve * 1.2);

    path2.moveTo(size.width * 0.2, boxHeight - 10);
    path2.lineTo(size.width * 0.2, boxHeight * 0.6);
    path2.lineTo(size.width * 0.8, boxHeight * 0.6);
    path2.lineTo(size.width * 0.8, boxHeight - 10);

    canvas.drawPath(path, paint);
    canvas.drawPath(path1, paint1);
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
