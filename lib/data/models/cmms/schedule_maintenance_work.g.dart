// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_maintenance_work.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleMaintenanceWork _$ScheduleMaintenanceWorkFromJson(
        Map<String, dynamic> json) =>
    ScheduleMaintenanceWork(
      deviceCode: json['deviceCode'] as String?,
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      estProcessTime: json['estProcessTime'] as int?,
      id: json['id'] as String?,
      materials: (json['materials'] as List<dynamic>?)
          ?.map((e) => Materials.fromJson(e as Map<String, dynamic>))
          .toList(),
      priority: json['priority'] as int?,
      problem: json['problem'] as String?,
    );

Map<String, dynamic> _$ScheduleMaintenanceWorkToJson(
    ScheduleMaintenanceWork instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('priority', instance.priority);
  writeNotNull('deviceCode', instance.deviceCode);
  writeNotNull('problem', instance.problem);
  writeNotNull('dueDate', instance.dueDate?.toIso8601String());
  writeNotNull('estProcessTime', instance.estProcessTime);
  writeNotNull(
      'materials', instance.materials?.map((e) => e.toJson()).toList());
  return val;
}
