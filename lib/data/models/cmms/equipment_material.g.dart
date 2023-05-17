// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_material.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EquipmentMaterial _$EquipmentMaterialFromJson(Map<String, dynamic> json) =>
    EquipmentMaterial(
      fullTime: (json['fullTime'] as num?)?.toDouble(),
      id: json['id'] as String?,
      installedTime: json['installedTime'] == null
          ? null
          : DateTime.parse(json['installedTime'] as String),
      materialInfo: json['materialInfo'] == null
          ? null
          : MaterialInfo.fromJson(json['materialInfo'] as Map<String, dynamic>),
      usedTime: (json['usedTime'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$EquipmentMaterialToJson(EquipmentMaterial instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('materialInfo', instance.materialInfo?.toJson());
  writeNotNull('fullTime', instance.fullTime);
  writeNotNull('usedTime', instance.usedTime);
  writeNotNull('installedTime', instance.installedTime?.toIso8601String());
  return val;
}
