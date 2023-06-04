// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateResponse _$UpdateResponseFromJson(Map<String, dynamic> json) =>
    UpdateResponse(
      actualFinishTime: json['actualFinishTime'] == null
          ? null
          : DateTime.parse(json['actualFinishTime'] as String),
      actualStartTime: json['actualStartTime'] == null
          ? null
          : DateTime.parse(json['actualStartTime'] as String),
      cause:
          (json['cause'] as List<dynamic>?)?.map((e) => e as String).toList(),
      correction: (json['correction'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      materials: (json['materials'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      sounds:
          (json['sounds'] as List<dynamic>?)?.map((e) => e as String).toList(),
      status: $enumDecodeNullable(_$MaintenanceStatusEnumMap, json['status']),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      inspectionReports: (json['inspectionReports'] as List<dynamic>?)
          ?.map((e) => InspectionReport.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: $enumDecodeNullable(_$MaintenanceTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$UpdateResponseToJson(UpdateResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cause', instance.cause);
  writeNotNull('correction', instance.correction);
  writeNotNull('actualStartTime', instance.actualStartTime?.toIso8601String());
  writeNotNull(
      'actualFinishTime', instance.actualFinishTime?.toIso8601String());
  writeNotNull('status', _$MaintenanceStatusEnumMap[instance.status]);
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  writeNotNull('images', instance.images);
  writeNotNull('sounds', instance.sounds);
  writeNotNull('materials', instance.materials);
  writeNotNull('inspectionReports',
      instance.inspectionReports?.map((e) => e.toJson()).toList());
  writeNotNull('type', _$MaintenanceTypeEnumMap[instance.type]);
  return val;
}

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
