// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_obj.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChartObj _$ChartObjFromJson(Map<String, dynamic> json) => ChartObj(
      name: json['name'] as String?,
      value: (json['value'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ChartObjToJson(ChartObj instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('value', instance.value);
  return val;
}
