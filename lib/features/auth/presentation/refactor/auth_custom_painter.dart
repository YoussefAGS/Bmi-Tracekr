import 'package:flutter/material.dart';

class AuthCustomPainter extends CustomPainter {
  final LinearGradient gradient;

  AuthCustomPainter({required this.gradient});

  @override
  void paint(Canvas canvas, Size size) {
    // Paint for filling shapes
    final Paint fillPaint = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    // Gradient shader
    final Paint gradientPaint = Paint()
      ..shader = gradient.createShader(Rect.fromPoints(Offset.zero, Offset(0, size.height)));

    // Path for drawing shapes
    final Path path = Path();
    _drawPath(path, size);

    // Draw filled shape with gradient
    canvas.drawPath(path, fillPaint..shader = gradient.createShader(
      Rect.fromPoints(Offset(size.width * 0.29, size.height * 0.43), Offset(size.width * 0.66, size.height * 0.43)),
    ));

    // Draw stroke shape
    canvas.drawPath(path, gradientPaint);
  }

  void _drawPath(Path path, Size size) {
    path
      ..moveTo(size.width * 0.2900000, size.height * 0.3614286)
      ..lineTo(size.width * 0.2916667, size.height * 0.5014286)
      ..lineTo(size.width * 0.6625000, size.height * 0.5000000)
      ..lineTo(size.width * -0.0345067, size.height * 0.6583005)
      ..lineTo(size.width * 1.0372800, size.height * 1.0012192)
      ..lineTo(size.width * 1.0394667, size.height * 1.0054064)
      ..lineTo(size.width * -0.0378133, size.height * 0.9998645);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
