// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/weather_entity.dart';

part 'daily_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DailyObjectModel {
  List<String>? time;
  @JsonKey(name: 'weathercode')
  List<int>? weatherCode;
  DailyObjectModel({
    this.time,
    this.weatherCode,
  });

  List<WeatherEntity>? getWeatherEntites() {
    final result = <WeatherEntity>[];
    if (time?.length != weatherCode?.length) {
      return null;
    } else {
      for (var i = 0; i < (time?.length ?? 0); i++) {
        result.add(WeatherEntity(time: time?[i], weatherCode: weatherCode?[i]));
      }
    }
    return result;
  }

  factory DailyObjectModel.fromJson(Map<String, dynamic> json) =>
      _$DailyObjectModelFromJson(json);

  Map<String, dynamic> toJson() => _$DailyObjectModelToJson(this);
}
