// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Equipment _$EquipmentFromJson(Map<String, dynamic> json) => Equipment(
      id: json['equipmentId'] as String?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      mtbf: json['mtbf'] == null
          ? null
          : PerformanceIndex.fromJson(json['mtbf'] as Map<String, dynamic>),
      mttf: json['mttf'] == null
          ? null
          : PerformanceIndex.fromJson(json['mttf'] as Map<String, dynamic>),
      oee: json['oee'] == null
          ? null
          : PerformanceIndex.fromJson(json['oee'] as Map<String, dynamic>),
      recentMaintenanceWorkOrder: json['recentMaintenanceWorkOrder'] == null
          ? null
          : MaintenanceResponse.fromJson(
              json['recentMaintenanceWorkOrder'] as Map<String, dynamic>),
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => ChartObj.fromJson(e as Map<String, dynamic>))
          .toList(),
      material: (json['material'] as List<dynamic>?)
          ?.map((e) => EquipmentMaterial.fromJson(e as Map<String, dynamic>))
          .toList(),
      scheduleWorkingTimes: (json['scheduleWorkingTimes'] as List<dynamic>?)
          ?.map((e) => WorkingTime.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: $enumDecodeNullable(_$EquipmentTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$EquipmentToJson(Equipment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equipmentId', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('code', instance.code);
  writeNotNull('type', _$EquipmentTypeEnumMap[instance.type]);
  writeNotNull('mttf', instance.mttf?.toJson());
  writeNotNull('mtbf', instance.mtbf?.toJson());
  writeNotNull('oee', instance.oee?.toJson());
  writeNotNull('recentMaintenanceWorkOrder',
      instance.recentMaintenanceWorkOrder?.toJson());
  writeNotNull('errors', instance.errors?.map((e) => e.toJson()).toList());
  writeNotNull('material', instance.material?.map((e) => e.toJson()).toList());
  writeNotNull('scheduleWorkingTimes',
      instance.scheduleWorkingTimes?.map((e) => e.toJson()).toList());
  return val;
}

const _$EquipmentTypeEnumMap = {
  EquipmentType.bigInjection: 'bigInjection',
  EquipmentType.smallInjection: 'smallInjection',
};
