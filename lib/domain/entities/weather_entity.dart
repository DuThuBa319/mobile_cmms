// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../common/utils.dart';
import '../../generated/assets.dart';
import '../../presentation/theme/theme_color.dart';

class WeatherEntity {
  String? time;
  int? weatherCode;

  WeatherEntity({
    this.time,
    this.weatherCode,
  });

  WeatherStatus get weatherStatus {
    // Based on WMO Weather interpretation codes (WW)
    switch (weatherCode) {
      case 0:
      case 1:
      case 2:
      case 3:
        return WeatherStatus.sunny;
      case 80:
      case 81:
      case 82:
        return WeatherStatus.rainy;
      case 45:
      case 48:
        return WeatherStatus.foggy;
      case 95:
        return WeatherStatus.thunderStorm;
      default:
        return WeatherStatus.undefine;
    }
  }

  String get weatherTitle {
    switch (weatherStatus) {
      case WeatherStatus.sunny:
        return 'Nắng đẹp';
      case WeatherStatus.rainy:
        return 'Mưa rào';
      case WeatherStatus.thunderStorm:
        return 'Sấm chớp';
      case WeatherStatus.foggy:
        return 'Sương mù';
      default:
        return 'Chưa xác định';
    }
  }

  String get weatherIcon {
    switch (weatherStatus) {
      case WeatherStatus.sunny:
        return Assets.icSunny;
      case WeatherStatus.rainy:
        return Assets.icRainy;
      case WeatherStatus.thunderStorm:
        return Assets.icThunderstorm;
      case WeatherStatus.foggy:
        return Assets.icFoggy;
      default:
        return Assets.icSunny; //undefinde
    }
  }

  DateTime? get dateTime {
    if (time == null) {
      return null;
    }
    return DateTime.parse(time!);
  }

  String get dateDisplay {
    return dateTime?.serverToTransaction() ?? '--';
  }

  Color get weatherColor {
    switch (weatherStatus) {
      case WeatherStatus.sunny:
        return AppColor.yellowFFF59D;
      case WeatherStatus.rainy:
        return AppColor.blue81D4FA;
      case WeatherStatus.thunderStorm:
        return AppColor.graybebebe;
      case WeatherStatus.foggy:
        return AppColor.graydcdcdc;
      default:
        return AppColor.graydcdcdc;
    }
  }
}

enum WeatherStatus { sunny, rainy, foggy, thunderStorm, undefine }
