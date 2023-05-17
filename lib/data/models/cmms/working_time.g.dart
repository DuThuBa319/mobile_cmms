// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'working_time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkingTime _$WorkingTimeFromJson(Map<String, dynamic> json) => WorkingTime(
      from:
          json['from'] == null ? null : DateTime.parse(json['from'] as String),
      to: json['to'] == null ? null : DateTime.parse(json['to'] as String),
    );

Map<String, dynamic> _$WorkingTimeToJson(WorkingTime instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('from', instance.from?.toIso8601String());
  writeNotNull('to', instance.to?.toIso8601String());
  return val;
}
