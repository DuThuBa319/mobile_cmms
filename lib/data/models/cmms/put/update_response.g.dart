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
          ?.map((e) => Materials.fromJson(e as Map<String, dynamic>))
          .toList(),
      sounds:
          (json['sounds'] as List<dynamic>?)?.map((e) => e as String).toList(),
      status: $enumDecodeNullable(_$MaintenanceStatusEnumMap, json['status']),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
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
  writeNotNull(
      'materials', instance.materials?.map((e) => e.toJson()).toList());
  return val;
}

const _$MaintenanceStatusEnumMap = {
  MaintenanceStatus.assigned: 'assigned',
  MaintenanceStatus.inProgress: 'inProgress',
  MaintenanceStatus.review: 'review',
  MaintenanceStatus.completed: 'completed',
};
