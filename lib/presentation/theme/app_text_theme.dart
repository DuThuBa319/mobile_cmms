import 'package:flutter/material.dart';
import 'theme_color.dart';

class AppTextTheme {
  static const fontSize1 = 22.0;
  static const fontSize2 = 18.0;
  static const fontSize3 = 16.0;
  static const fontSize4 = 14.0;
  static const fontSize5 = 12.0;
  static const fontSize6 = 10.0;
  static const fontSize7 = 8.0;
  static TextStyle textLinkStyle = const TextStyle(
    decoration: TextDecoration.underline,
    color: AppColor.primaryColorLight,
    fontSize: 14,
  );

  static TextStyle body1 = const TextStyle(
    color: Colors.black,
    fontSize: fontSize1,
  );

  static TextStyle body2 = const TextStyle(
    color: Colors.black,
    fontSize: fontSize2,
  );

  static TextStyle body3 = const TextStyle(
    color: Colors.black,
    fontSize: fontSize3,
  );

  static TextStyle body4 = const TextStyle(
    color: Colors.black,
    fontSize: fontSize4,
  );

  static TextStyle body5 = const TextStyle(
    color: Colors.black,
    fontSize: fontSize5,
  );

  static TextStyle title1 = const TextStyle(
    color: AppColor.gray767676,
    fontSize: fontSize1,
    fontWeight: FontWeight.bold,
  );

  static TextStyle title2 = const TextStyle(
    color: AppColor.gray767676,
    fontSize: fontSize2,
    fontWeight: FontWeight.bold,
  );

  static TextStyle title3 = const TextStyle(
    color: AppColor.gray767676,
    fontSize: fontSize3,
    fontWeight: FontWeight.bold,
  );

  static TextStyle title4 = const TextStyle(
    color: AppColor.gray767676,
    fontSize: fontSize4,
    fontWeight: FontWeight.bold,
  );

  static TextStyle title5 = const TextStyle(
    color: AppColor.gray767676,
    fontSize: fontSize5,
    fontWeight: FontWeight.bold,
  );

  static TextTheme getDefaultTextTheme() => const TextTheme(
        headline3: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColor.primaryColor,
        ),
        headline4: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColor.primaryText,
        ),
        headline5: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColor.primaryText,
        ),
        headline6: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: AppColor.subText,
        ),
        subtitle1: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppColor.subText,
        ),
        subtitle2: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColor.subText,
        ),
        bodyText1: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColor.primaryText,
        ),
        bodyText2: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColor.primaryText,
        ),
        caption: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColor.primaryText,
        ),
        button: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      );
  static TextTheme getDefaultTextThemeDark() => const TextTheme(
        headline3: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColor.primaryColor,
        ),
        headline4: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: AppColor.primaryDarkText,
        ),
        headline5: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColor.primaryDarkText,
        ),
        headline6: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColor.primaryDarkText,
        ),
        subtitle1: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppColor.subDarkText,
        ),
        subtitle2: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColor.subDarkText,
        ),
        bodyText1: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColor.primaryDarkText,
        ),
        bodyText2: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColor.primaryDarkText,
        ),
        caption: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColor.primaryDarkText,
        ),
        button: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColor.primaryDarkText,
        ),
      );
}
