import 'dart:async';
import 'dart:math';

import 'package:clock_app/widgets/clock_painter.dart';
import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  const ClockView({super.key});

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(
            context: context,
            dateTime: _dateTime,
          ),
        ),
      ),
    );
  }
}
