// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performance_index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PerformanceIndex _$PerformanceIndexFromJson(Map<String, dynamic> json) =>
    PerformanceIndex(
      history: (json['history'] as List<dynamic>?)
          ?.map((e) => TimeSeriesObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      isTracking: json['isTracking'] as bool?,
      maxLength: json['maxLength'] as int?,
      recentValue: (json['recentValue'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PerformanceIndexToJson(PerformanceIndex instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('isTracking', instance.isTracking);
  writeNotNull('recentValue', instance.recentValue);
  writeNotNull('history', instance.history?.map((e) => e.toJson()).toList());
  writeNotNull('maxLength', instance.maxLength);
  return val;
}
