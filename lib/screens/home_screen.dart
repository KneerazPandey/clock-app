import 'package:clock_app/core/data/menu.dart';
import 'package:clock_app/core/enum/enums.dart';
import 'package:clock_app/models/menu_info.dart';
import 'package:flutter/material.dart';
import 'package:clock_app/widgets/clock_view.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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
              children: menuItems.map((currentMenuInfo) {
                return MenuItemButton(currentMenuInfo: currentMenuInfo);
              }).toList(),
            ),
          ),
          const VerticalDivider(
            color: Colors.white38,
            width: 0.8,
          ),
          Expanded(
            child: Consumer<MenuInfo>(
              builder: (BuildContext context, MenuInfo value, Widget? child) {
                if (value.menuType == MenuType.alarm) {
                  return const Center(
                    child: Text(
                      'Alarm',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                } else if (value.menuType == MenuType.timer) {
                  return const Center(
                      child: Text(
                    'Timer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ));
                } else if (value.menuType == MenuType.stopwatch) {
                  return const Center(
                      child: Text(
                    'StopWatch',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ));
                }

                return Container(
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItemButton extends StatelessWidget {
  final MenuInfo currentMenuInfo;

  const MenuItemButton({
    super.key,
    required this.currentMenuInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, MenuInfo value, Widget? child) {
        return GestureDetector(
          onTap: () {
            var menuInfo = Provider.of<MenuInfo>(context, listen: false);
            menuInfo.updateMenu(currentMenuInfo);
          },
          child: Container(
            width: double.maxFinite,
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: currentMenuInfo.menuType == value.menuType
                  ? const Color.fromARGB(255, 59, 60, 71)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: <Widget>[
                Image.asset(
                  currentMenuInfo.imageSource,
                  scale: 1.5,
                ),
                Text(
                  currentMenuInfo.title,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
