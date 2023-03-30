// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceObjectModel _$DeviceObjectModelFromJson(Map<String, dynamic> json) =>
    DeviceObjectModel(
      id: json['id'] as int?,
      deviceName: json['device_name'] as String?,
      level: json['level'] as String?,
      status: json['status'] as String?,
      timeUpdate: json['time_update'] as String?,
      task: json['task'] as String?,
      maintenanceType: json['maintenance_type'] as String?,
    );

Map<String, dynamic> _$DeviceObjectModelToJson(DeviceObjectModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('device_name', instance.deviceName);
  writeNotNull('time_update', instance.timeUpdate);
  writeNotNull('level', instance.level);
  writeNotNull('status', instance.status);
  writeNotNull('task', instance.task);
  writeNotNull('maintenance_type', instance.maintenanceType);
  return val;
}
