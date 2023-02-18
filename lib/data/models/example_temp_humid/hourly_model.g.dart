// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyObjectModel _$HourlyObjectModelFromJson(Map<String, dynamic> json) =>
    HourlyObjectModel(
      time: (json['time'] as List<dynamic>?)?.map((e) => e as String).toList(),
      weatherCode: (json['weathercode'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      temperature: (json['temperature_2m'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      humidity: (json['relativehumidity_2m'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$HourlyObjectModelToJson(HourlyObjectModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('time', instance.time);
  writeNotNull('weathercode', instance.weatherCode);
  writeNotNull('temperature_2m', instance.temperature);
  writeNotNull('relativehumidity_2m', instance.humidity);
  return val;
}
