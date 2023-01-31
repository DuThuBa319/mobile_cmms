import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

class AppColor {
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color primaryColor = Color(0xFF03a1e4);
  static const Color primaryColorLight = Color(0xFF43c8f5);
  static const Color cardBackground = Color(0xFFf7f8f8);
  static const Color iconSelected = primaryColor;
  static const Color iconUnselected = Colors.grey;
  static const Color lightGrey = Color(0xFFbebebe);
  static const Color greyDC = Color(0xFFdcdcdc);
  static const Color greyF3 = Color(0xFFf3f3f3);
  static const Color scaffoldBackgroundColor = Color(0xFFF1F3F7);

  static const Color inactiveColor = Color(0xFF111111);
  static const Color activeColor = primaryColor;

  static const Color titleMenu = Colors.grey;
  static const Color primaryIcon = Colors.grey;
  static const Color green = Color(0xFF4d9e53);
  static const Color darkGreen = Color(0xFF24A148);
  static const Color lightGreen = Color(0xFFDAFBE4);
  static const Color lightDarkGreen = Color(0xFFDAFBE4);
  static const Color red = Color(0xFFfb4b53);
  static const Color lightRed = Color(0xFFFFF0F1);
  static const Color darkBlue = Color(0xFF002d41);
  static const Color orange = Color(0xFFFF9B1A);
  static const Color lightOrange = Color(0xFFFFF2DF);
  static const Color color00A1E4 = Color(0xFF00A1E4);
  static const Color color43C8F5 = Color(0xFF43C8F5);
  static const Color colorFCC687 = Color(0xFFFCC687);
  static const Color colorF286A0 = Color(0xFFF286A0);
  static const Color color97C1FF = Color(0xFF97C1FF);
  static const Color colorEDF4FF = Color(0xFFEDF4FF);

  //Custom color
  static const Color gray767676 = Color(0xFF767676);

  //light
  static const Color primaryText = Colors.black;
  static const Color subText = Color(0xFF767676);

  //dart
  static const Color primaryDarkText = Colors.black;
  static const Color subDarkText = Colors.grey;

  static void setLightStatusBar() {
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
  }

  static void setDarkStatusBar() {
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
  }
}
