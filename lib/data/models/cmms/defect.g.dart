// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'defect.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Defect _$DefectFromJson(Map<String, dynamic> json) => Defect(
      code: json['code'] as String?,
      equipmentType:
          $enumDecodeNullable(_$EquipmentTypeEnumMap, json['equipmentType']),
      estProcessTime: json['estProcessTime'] == null
          ? null
          : Duration(microseconds: json['estProcessTime'] as int),
      id: json['id'] as String?,
      maintenanceType: $enumDecodeNullable(
          _$MaintenanceDefectTypeEnumMap, json['maintenanceType']),
      name: json['name'] as String?,
      note: json['note'] as String?,
      severity: $enumDecodeNullable(_$DefectSeverityEnumMap, json['severity']),
      type: $enumDecodeNullable(_$SolutionTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$DefectToJson(Defect instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('code', instance.code);
  writeNotNull('maintenanceType',
      _$MaintenanceDefectTypeEnumMap[instance.maintenanceType]);
  writeNotNull('type', _$SolutionTypeEnumMap[instance.type]);
  writeNotNull('equipmentType', _$EquipmentTypeEnumMap[instance.equipmentType]);
  writeNotNull('name', instance.name);
  writeNotNull('estProcessTime', instance.estProcessTime?.inMicroseconds);
  writeNotNull('note', instance.note);
  writeNotNull('severity', _$DefectSeverityEnumMap[instance.severity]);
  return val;
}

const _$EquipmentTypeEnumMap = {
  EquipmentType.bigInjector: 'bigInjector',
  EquipmentType.smallInjector: 'smallInjector',
  EquipmentType.mold: 'mold',
};

const _$MaintenanceDefectTypeEnumMap = {
  MaintenanceDefectType.reactive: 'reactive',
  MaintenanceDefectType.preventive: 'preventive',
  MaintenanceDefectType.predictive: 'predictive',
};

const _$DefectSeverityEnumMap = {
  DefectSeverity.urgent: 'urgent',
  DefectSeverity.high: 'high',
  DefectSeverity.normal: 'normal',
  DefectSeverity.low: 'low',
};

const _$SolutionTypeEnumMap = {
  SolutionType.repair: 'repair',
  SolutionType.replace: 'replace',
};
