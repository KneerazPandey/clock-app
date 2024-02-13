import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  final BuildContext context;
  final DateTime dateTime;

  const ClockPainter({
    required this.context,
    required this.dateTime,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);
    double radius = min(centerX, centerY);

    // Drawind Circles
    Paint circleInnerPaint = Paint()..color = const Color(0xFF444974);
    Paint circleOuterPaint = Paint()
      ..color = const Color(0xFFEAECff)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 20;
    canvas.drawCircle(center, radius * 0.75, circleInnerPaint);
    canvas.drawCircle(center, radius * 0.75, circleOuterPaint);

    // Drawing hour handler
    Paint hourPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..shader = const RadialGradient(
        colors: <Color>[Color(0xFFEA74AB), Color(0xFFC279FB)],
      ).createShader(
        Rect.fromCircle(
          center: center,
          radius: radius,
        ),
      )
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width / 24;
    double hourXOffset = centerX +
        radius *
            0.32 *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    double hourYOffset = centerY +
        radius *
            0.32 *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourXOffset, hourYOffset), hourPaint);

    // Drawing minute handler
    Paint minutePaint = Paint()
      ..strokeCap = StrokeCap.round
      ..shader = const RadialGradient(
        colors: <Color>[Color(0xFF748EF6), Color(0xFF77DDFF)],
      ).createShader(
        Rect.fromCircle(
          center: center,
          radius: radius,
        ),
      )
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width / 34;
    double minXOffset =
        centerX + radius * 0.45 * cos(dateTime.minute * 6 * pi / 180);
    double minYOffset =
        centerY + radius * 0.45 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minXOffset, minYOffset), minutePaint);

    // Drawing second handler
    Paint secondPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..color = Colors.orange[300]!
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width / 60;
    double secXOffset =
        centerX + radius * 0.60 * cos(dateTime.second * 6 * pi / 180);
    double secYOffset =
        centerY + radius * 0.60 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secXOffset, secYOffset), secondPaint);

    // Drawing innter->innter dot circle
    Paint dotPaint = Paint()..color = const Color(0xFFEAECff);
    canvas.drawCircle(center, 16, dotPaint);

    // Drawing Outer Brushes
    Paint linePaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2;
    double outerLine = radius;
    double innterLine = radius * 0.9;
    for (int i = 0; i < 360; i += 12) {
      double x1 = centerX + outerLine * cos(i * pi / 180);
      double y1 = centerX + outerLine * sin(i * pi / 180);
      double x2 = centerX + innterLine * cos(i * pi / 180);
      double y2 = centerX + innterLine * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), linePaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
