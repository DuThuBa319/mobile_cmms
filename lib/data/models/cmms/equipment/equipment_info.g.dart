// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EquipmentInfo _$EquipmentInfoFromJson(Map<String, dynamic> json) =>
    EquipmentInfo(
      code: json['code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$EquipmentInfoToJson(EquipmentInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('name', instance.name);
  return val;
}
