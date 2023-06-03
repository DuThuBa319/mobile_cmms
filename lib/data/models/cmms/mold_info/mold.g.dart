// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mold.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mold _$MoldFromJson(Map<String, dynamic> json) => Mold(
      moldId: json['moldId'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      cavity: json['cavity'] as int?,
    );

Map<String, dynamic> _$MoldToJson(Mold instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('moldId', instance.moldId);
  writeNotNull('code', instance.code);
  writeNotNull('name', instance.name);
  writeNotNull('cavity', instance.cavity);
  return val;
}
