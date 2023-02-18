// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemperatureModel _$TemperatureModelFromJson(Map<String, dynamic> json) =>
    TemperatureModel(
      hourly: json['hourly'] == null
          ? null
          : HourlyObjectModel.fromJson(json['hourly'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TemperatureModelToJson(TemperatureModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('hourly', instance.hourly?.toJson());
  return val;
}
