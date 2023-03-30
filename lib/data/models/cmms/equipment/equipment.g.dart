// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Equipment _$EquipmentFromJson(Map<String, dynamic> json) => Equipment(
      id: json['id'] as String?,
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
          : MaintenanceWorkOrder.fromJson(
              json['recentMaintenanceWorkOrder'] as Map<String, dynamic>),
      status: $enumDecodeNullable(_$MaintenanceStatusEnumMap, json['status']),
    )..type = $enumDecodeNullable(_$EquipmentTypeEnumMap, json['type']);

Map<String, dynamic> _$EquipmentToJson(Equipment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('code', instance.code);
  writeNotNull('type', _$EquipmentTypeEnumMap[instance.type]);
  writeNotNull('mttf', instance.mttf?.toJson());
  writeNotNull('mtbf', instance.mtbf?.toJson());
  writeNotNull('oee', instance.oee?.toJson());
  writeNotNull('status', _$MaintenanceStatusEnumMap[instance.status]);
  writeNotNull('recentMaintenanceWorkOrder',
      instance.recentMaintenanceWorkOrder?.toJson());
  return val;
}

const _$MaintenanceStatusEnumMap = {
  MaintenanceStatus.assigned: 'assigned',
  MaintenanceStatus.inProgress: 'inProgress',
  MaintenanceStatus.review: 'review',
  MaintenanceStatus.completed: 'completed',
};

const _$EquipmentTypeEnumMap = {
  EquipmentType.bigInjector: 'bigInjector',
  EquipmentType.smallInjector: 'smallInjector',
  EquipmentType.mold: 'mold',
};
