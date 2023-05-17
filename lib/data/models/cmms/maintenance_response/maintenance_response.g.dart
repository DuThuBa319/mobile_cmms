// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaintenanceResponse _$MaintenanceResponseFromJson(Map<String, dynamic> json) =>
    MaintenanceResponse(
      id: json['maintenanceResponseId'] as String?,
      plannedStart: json['plannedStart'] == null
          ? null
          : DateTime.parse(json['plannedStart'] as String),
      plannedFinish: json['plannedFinish'] == null
          ? null
          : DateTime.parse(json['plannedFinish'] as String),
      code: json['code'] as String?,
      actualFinishTime: json['actualFinishTime'] == null
          ? null
          : DateTime.parse(json['actualFinishTime'] as String),
      actualStartTime: json['actualStartTime'] == null
          ? null
          : DateTime.parse(json['actualStartTime'] as String),
      cause: (json['cause'] as List<dynamic>?)
          ?.map((e) => Cause.fromJson(e as Map<String, dynamic>))
          .toList(),
      correction: (json['correction'] as List<dynamic>?)
          ?.map((e) => Correction.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      equipment: json['equipment'] == null
          ? null
          : Equipment.fromJson(json['equipment'] as Map<String, dynamic>),
      estProcessTime: json['estProcessTime'] as int?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      maintenanceObject: $enumDecodeNullable(
          _$MaintenanceObjectEnumMap, json['maintenanceObject']),
      materials: (json['materials'] as List<dynamic>?)
          ?.map((e) => Materials.fromJson(e as Map<String, dynamic>))
          .toList(),
      mold: json['mold'] == null
          ? null
          : Mold.fromJson(json['mold'] as Map<String, dynamic>),
      note: json['note'] as String?,
      priority: json['priority'] as int?,
      problem: json['problem'] as String?,
      request: json['request'] == null
          ? null
          : MaintenanceRequest.fromJson(
              json['request'] as Map<String, dynamic>),
      responsiblePerson: json['responsiblePerson'] == null
          ? null
          : Employee.fromJson(
              json['responsiblePerson'] as Map<String, dynamic>),
      sounds:
          (json['sounds'] as List<dynamic>?)?.map((e) => e as String).toList(),
      status: $enumDecodeNullable(_$MaintenanceStatusEnumMap, json['status']),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      type: $enumDecodeNullable(_$MaintenanceTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$MaintenanceResponseToJson(MaintenanceResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maintenanceResponseId', instance.id);
  writeNotNull('plannedStart', instance.plannedStart?.toIso8601String());
  writeNotNull('plannedFinish', instance.plannedFinish?.toIso8601String());
  writeNotNull('code', instance.code);
  writeNotNull('cause', instance.cause?.map((e) => e.toJson()).toList());
  writeNotNull(
      'correction', instance.correction?.map((e) => e.toJson()).toList());
  writeNotNull('estProcessTime', instance.estProcessTime);
  writeNotNull('actualStartTime', instance.actualStartTime?.toIso8601String());
  writeNotNull(
      'actualFinishTime', instance.actualFinishTime?.toIso8601String());
  writeNotNull('status', _$MaintenanceStatusEnumMap[instance.status]);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  writeNotNull('responsiblePerson', instance.responsiblePerson?.toJson());
  writeNotNull('priority', instance.priority);
  writeNotNull('problem', instance.problem);
  writeNotNull('images', instance.images);
  writeNotNull('sounds', instance.sounds);
  writeNotNull(
      'materials', instance.materials?.map((e) => e.toJson()).toList());
  writeNotNull('note', instance.note);
  writeNotNull('request', instance.request?.toJson());
  writeNotNull('maintenanceObject',
      _$MaintenanceObjectEnumMap[instance.maintenanceObject]);
  writeNotNull('equipment', instance.equipment?.toJson());
  writeNotNull('mold', instance.mold?.toJson());
  writeNotNull('dueDate', instance.dueDate?.toIso8601String());
  writeNotNull('type', _$MaintenanceTypeEnumMap[instance.type]);
  return val;
}

const _$MaintenanceObjectEnumMap = {
  MaintenanceObject.equipment: 'equipment',
  MaintenanceObject.mold: 'mold',
};

const _$MaintenanceStatusEnumMap = {
  MaintenanceStatus.assigned: 'assigned',
  MaintenanceStatus.inProgress: 'inProgress',
  MaintenanceStatus.review: 'review',
  MaintenanceStatus.completed: 'completed',
};

const _$MaintenanceTypeEnumMap = {
  MaintenanceType.reactive: 'reactive',
  MaintenanceType.preventive: 'preventive',
  MaintenanceType.predictive: 'predictive',
  MaintenanceType.preventiveInspection: 'preventiveInspection',
};
