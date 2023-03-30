// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_series_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeSeriesObject _$TimeSeriesObjectFromJson(Map<String, dynamic> json) =>
    TimeSeriesObject(
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
      value: (json['value'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TimeSeriesObjectToJson(TimeSeriesObject instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('time', instance.time?.toIso8601String());
  writeNotNull('value', instance.value);
  return val;
}
