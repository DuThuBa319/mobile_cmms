// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../../common/utils.dart';
import '../../generated/assets.dart';
import '../../presentation/theme/theme_color.dart';

class TemperatureEntity {
  String? time;
  int? weatherCode;
  double? temperature;
  int? humidity;
  TemperatureEntity({
    this.time,
    this.weatherCode,
    this.temperature,
    this.humidity,
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
        return 'Trời trong';
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
    final dateTime = DateTime.parse(time.toString());
    final hour = dateTime.hour;
    switch (weatherStatus) {
      case WeatherStatus.sunny:
        break;

      case WeatherStatus.rainy:
        return Assets.icRainy;
      case WeatherStatus.thunderStorm:
        return Assets.icThunderstorm;
      case WeatherStatus.foggy:
        return Assets.icFoggy;
      default:
        return Assets.icSunny; //undefinde
    }
    if (hour > 6 && hour < 18) {
      return Assets.icSunny;
    } else {
      return Assets.icMoon;
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

//--------------------------

  TemperatureStatus get temperatureStatus {
    if (temperature != null) {
      final temp = temperature ?? 30;
      if (temp > 30) {
        return TemperatureStatus.hot;
      }
      if (temp > 25) {
        return TemperatureStatus.warm;
      }
      if (temp > 20) {
        return TemperatureStatus.cool;
      }
      return TemperatureStatus.cold;
    }
    return TemperatureStatus.undefine;
  }

  String get temperatureTitle {
    switch (temperatureStatus) {
      case TemperatureStatus.hot:
        return 'thời tiết nóng';
      case TemperatureStatus.warm:
        return 'Thời tiết ấm';
      case TemperatureStatus.cool:
        return 'Thời tiết mát mẻ';
      case TemperatureStatus.cold:
        return 'Thời tiết lạnh';
      default:
        return 'Không xác định';
    }
  }

  Color get temperatureColor {
    switch (temperatureStatus) {
      case TemperatureStatus.hot:
        return Colors.yellow;
      case TemperatureStatus.warm:
        return AppColor.yellowFFF59D;
      case TemperatureStatus.cool:
        return AppColor.blue81D4FA;
      case TemperatureStatus.cold:
        return AppColor.blue03A1E4;
      default:
        return AppColor.graydcdcdc;
    }
  }
}

enum WeatherStatus { sunny, rainy, foggy, thunderStorm, undefine }

enum TemperatureStatus { hot, warm, cool, cold, undefine }
