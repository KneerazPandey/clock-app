import 'package:clock_app/core/enum/enums.dart';
import 'package:clock_app/models/menu_info.dart';
import 'package:clock_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MenuInfo>(
      create: (BuildContext context) => MenuInfo(
        menuType: MenuType.clock,
        title: 'Clock',
        imageSource: 'assets/images/clock_icon.png',
      ),
      child: MaterialApp(
        title: 'Clock App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
