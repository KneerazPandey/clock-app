import 'package:clock_app/core/enum/enums.dart';
import 'package:flutter/material.dart';

class MenuInfo extends ChangeNotifier {
  MenuType menuType;
  String title;
  String imageSource;

  MenuInfo({
    required this.menuType,
    required this.title,
    required this.imageSource,
  });

  void updateMenu(MenuInfo menuInfo) {
    menuType = menuInfo.menuType;
    title = menuInfo.title;
    imageSource = menuInfo.imageSource;
    notifyListeners();
  }
}
