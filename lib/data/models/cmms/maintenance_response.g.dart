// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaintenanceResponse _$MaintenanceResponseFromJson(Map<String, dynamic> json) =>
    MaintenanceResponse(
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
      note: json['note'] as String?,
      parts: (json['parts'] as List<dynamic>?)
          ?.map((e) => MaintenancePart.fromJson(e as Map<String, dynamic>))
          .toList(),
      responsiblePerson: json['responsiblePerson'] == null
          ? null
          : Employee.fromJson(
              json['responsiblePerson'] as Map<String, dynamic>),
      sounds:
          (json['sounds'] as List<dynamic>?)?.map((e) => e as String).toList(),
      status: $enumDecodeNullable(_$MaintenanceStatusEnumMap, json['status']),
      statusTime: json['statusTime'] == null
          ? null
          : DateTime.parse(json['statusTime'] as String),
    );

Map<String, dynamic> _$MaintenanceResponseToJson(MaintenanceResponse instance) {
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
  writeNotNull('statusTime', instance.statusTime?.toIso8601String());
  writeNotNull('responsiblePerson', instance.responsiblePerson?.toJson());
  writeNotNull('images', instance.images);
  writeNotNull('sounds', instance.sounds);
  writeNotNull('parts', instance.parts?.map((e) => e.toJson()).toList());
  writeNotNull('note', instance.note);
  return val;
}

const _$MaintenanceStatusEnumMap = {
  MaintenanceStatus.assigned: 'assigned',
  MaintenanceStatus.inProgress: 'inProgress',
  MaintenanceStatus.review: 'review',
  MaintenanceStatus.completed: 'completed',
};
