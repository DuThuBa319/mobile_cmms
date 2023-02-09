// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'daily_model.dart';

part 'weather_model.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class WeatherModel {
  DailyObjectModel? daily;
  WeatherModel({
    this.daily,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

enum WeatherStatus { sunny, rainy, thunderStorm }
