import 'package:flutter/material.dart';
import 'package:clock_app/widgets/clock_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF2D2F41),
        child: const Center(
          child: ClockView(),
        ),
      ),
    );
  }
}
