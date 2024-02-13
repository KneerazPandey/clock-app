import 'package:flutter/material.dart';
import 'package:clock_app/widgets/clock_view.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat("HH:mm").format(now);
    var formattedDate = DateFormat("EEE, d MMM").format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (timezoneString.startsWith('-')) offsetSign = '+';
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF2D2F41),
      body: Row(
        children: <Widget>[
          Container(
            width: size.width * 0.24,
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MenuItemButton(
                  onPressed: () {},
                  image: 'assets/images/clock_icon.png',
                  text: 'Clock',
                ),
                MenuItemButton(
                  onPressed: () {},
                  image: 'assets/images/alarm_icon.png',
                  text: 'Alarm',
                ),
                MenuItemButton(
                  onPressed: () {},
                  image: 'assets/images/timer_icon.png',
                  text: 'Timer',
                ),
                MenuItemButton(
                  onPressed: () {},
                  image: 'assets/images/stopwatch_icon.png',
                  text: 'StopWatch',
                ),
              ],
            ),
          ),
          const VerticalDivider(
            color: Colors.white38,
            width: 0.8,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(32),
              alignment: Alignment.center,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Clock",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      formattedTime,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 64,
                      ),
                    ),
                    Text(
                      formattedDate,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 40),
                    const ClockView(),
                    const SizedBox(height: 40),
                    const Text(
                      "Timezone",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        const Icon(
                          Icons.language,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 16),
                        Text(
                          "UTC$offsetSign$timezoneString",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItemButton extends StatelessWidget {
  final String text;
  final String image;
  final VoidCallback onPressed;

  const MenuItemButton({
    super.key,
    required this.image,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.maxFinite,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 59, 60, 71),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: <Widget>[
            Image.asset(
              image,
              scale: 1.5,
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
