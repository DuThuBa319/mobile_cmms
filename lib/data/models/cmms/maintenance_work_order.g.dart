// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_work_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaintenanceWorkOrder _$MaintenanceWorkOrderFromJson(
        Map<String, dynamic> json) =>
    MaintenanceWorkOrder(
      id: json['id'] as String?,
      plannedStart: json['plannedStart'] == null
          ? null
          : DateTime.parse(json['plannedStart'] as String),
      plannedFinish: json['plannedFinish'] == null
          ? null
          : DateTime.parse(json['plannedFinish'] as String),
      status: $enumDecodeNullable(_$MaintenanceStatusEnumMap, json['status']),
      code: json['code'] as String?,
      equipment: json['equipment'] == null
          ? null
          : Equipment.fromJson(json['equipment'] as Map<String, dynamic>),
      problem: json['problem'] as String?,
      request: json['request'] == null
          ? null
          : MaintenanceRequest.fromJson(
              json['request'] as Map<String, dynamic>),
      type: $enumDecodeNullable(_$MaintenanceDefectTypeEnumMap, json['type']),
      defects: (json['defects'] as List<dynamic>?)
          ?.map((e) => Defect.fromJson(e as Map<String, dynamic>))
          .toList(),
      responsiblePerson: json['responsiblePerson'] == null
          ? null
          : Employee.fromJson(
              json['responsiblePerson'] as Map<String, dynamic>),
      reviewer: json['reviewer'] == null
          ? null
          : Employee.fromJson(json['reviewer'] as Map<String, dynamic>),
      resources: (json['resources'] as List<dynamic>?)
          ?.map((e) => MaintenancePart.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MaintenanceWorkOrderToJson(
    MaintenanceWorkOrder instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('plannedStart', instance.plannedStart?.toIso8601String());
  writeNotNull('plannedFinish', instance.plannedFinish?.toIso8601String());
  writeNotNull('status', _$MaintenanceStatusEnumMap[instance.status]);
  writeNotNull('code', instance.code);
  writeNotNull('type', _$MaintenanceDefectTypeEnumMap[instance.type]);
  writeNotNull('request', instance.request?.toJson());
  writeNotNull('equipment', instance.equipment?.toJson());
  writeNotNull('problem', instance.problem);
  writeNotNull('defects', instance.defects?.map((e) => e.toJson()).toList());
  writeNotNull('responsiblePerson', instance.responsiblePerson?.toJson());
  writeNotNull('reviewer', instance.reviewer?.toJson());
  writeNotNull(
      'resources', instance.resources?.map((e) => e.toJson()).toList());
  return val;
}

const _$MaintenanceStatusEnumMap = {
  MaintenanceStatus.assigned: 'assigned',
  MaintenanceStatus.inProgress: 'inProgress',
  MaintenanceStatus.review: 'review',
  MaintenanceStatus.completed: 'completed',
};

const _$MaintenanceDefectTypeEnumMap = {
  MaintenanceDefectType.reactive: 'reactive',
  MaintenanceDefectType.preventive: 'preventive',
  MaintenanceDefectType.predictive: 'predictive',
};
