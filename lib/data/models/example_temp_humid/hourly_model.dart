// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/temperature_entity.dart';

part '../example_temp_humid/hourly_model.g.dart';

@JsonSerializable()
class HourlyObjectModel {
  List<String>? time;
  @JsonKey(name: 'weathercode')
  List<int>? weatherCode;
  @JsonKey(name: 'temperature_2m')
  List<double>? temperature;
  @JsonKey(name: 'relativehumidity_2m')
  List<int>? humidity;
  HourlyObjectModel({
    this.time,
    this.weatherCode,
    this.temperature,
    this.humidity,
  });

  List<TemperatureEntity>? getTemperatureEntites() {
    final result = <TemperatureEntity>[];
    if (time?.length != weatherCode?.length) {
      return null;
    } else {
      for (var i = 0; i < (time?.length ?? 0); i++) {
        result.add(
          TemperatureEntity(
            time: time?[i],
            weatherCode: weatherCode?[i],
            temperature: temperature?[i],
            humidity: humidity?[i],
          ),
        );
      }
    }
    return result;
  }

  factory HourlyObjectModel.fromJson(Map<String, dynamic> json) =>
      _$HourlyObjectModelFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyObjectModelToJson(this);
}
