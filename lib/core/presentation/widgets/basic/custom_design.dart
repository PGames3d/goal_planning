import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  final Color fillColor;
  final String text;

  RPSCustomPainter({required this.fillColor, required this.text});

  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1 - Fill
    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(0, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();

    path_0.moveTo(size.width * -0.0008333, size.height * 0.2158714);
    path_0.lineTo(size.width * 0.9986083, size.height * 0.2134714);
    path_0.lineTo(size.width * 0.9112583, size.height * 0.5014143);
    path_0.lineTo(size.width * 0.9966667, size.height * 0.7860286);
    path_0.lineTo(size.width * -0.0025000, size.height * 0.7846429);
    path_0.lineTo(size.width * 0.0868333, size.height * 0.5028000);
    path_0.lineTo(size.width * -0.0008333, size.height * 0.2158714);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);

    // Layer 2 - Border
    Paint paintStroke0 = Paint()
      ..color = fillColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.004
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    canvas.drawPath(path_0, paintStroke0);

    // Add Text
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: fillColor,
          fontSize: 16, // Adjust the font size as needed
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    textPainter.paint(
      canvas,
      Offset((size.width - textPainter.width) / 2,
          (size.height - textPainter.height) / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
