import 'dart:ui';

import 'package:flutter/material.dart';

class DashedBorderContainer extends StatelessWidget {
  final Widget child;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;
  final Color color;

  const DashedBorderContainer({
    super.key,
    required this.child,
    this.strokeWidth = 2.0,
    this.dashWidth = 5.0,
    this.dashSpace = 3.0,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedBorderPainter(
        strokeWidth: strokeWidth,
        dashWidth: dashWidth,
        dashSpace: dashSpace,
        color: color,
      ),
      child: child,
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;
  final Color color;

  DashedBorderPainter({
    required this.strokeWidth,
    required this.dashWidth,
    required this.dashSpace,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Path path = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    final Path dashedPath = Path();
    double currentLength = 0.0;
    for (PathMetric pathMetric in path.computeMetrics()) {
      while (currentLength < pathMetric.length) {
        dashedPath.addPath(
          pathMetric.extractPath(
            currentLength,
            currentLength + dashWidth,
          ),
          Offset.zero,
        );
        currentLength += dashWidth + dashSpace;
      }
    }

    canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}