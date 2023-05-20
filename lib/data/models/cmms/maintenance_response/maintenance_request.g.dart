// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaintenanceRequest _$MaintenanceRequestFromJson(Map<String, dynamic> json) =>
    MaintenanceRequest(
      equipment: json['equipment'] == null
          ? null
          : Equipment.fromJson(json['equipment'] as Map<String, dynamic>),
      problem: json['problem'] as String?,
      requestedPriority: json['requestedPriority'] as int?,
      type: $enumDecodeNullable(_$MaintenanceTypeEnumMap, json['type']),
      requester: json['requester'] == null
          ? null
          : Employee.fromJson(json['requester'] as Map<String, dynamic>),
      maintenanceObject: $enumDecodeNullable(
          _$MaintenanceObjectEnumMap, json['maintenanceObject']),
      status: $enumDecodeNullable(_$RequestStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$MaintenanceRequestToJson(MaintenanceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$MaintenanceTypeEnumMap[instance.type]);
  writeNotNull('requestedPriority', instance.requestedPriority);
  writeNotNull('equipment', instance.equipment?.toJson());
  writeNotNull('problem', instance.problem);
  writeNotNull('status', _$RequestStatusEnumMap[instance.status]);
  writeNotNull('requester', instance.requester?.toJson());
  writeNotNull('maintenanceObject',
      _$MaintenanceObjectEnumMap[instance.maintenanceObject]);
  return val;
}

const _$MaintenanceTypeEnumMap = {
  MaintenanceType.reactive: 'reactive',
  MaintenanceType.preventive: 'preventive',
  MaintenanceType.predictive: 'predictive',
  MaintenanceType.preventiveInspection: 'preventiveInspection',
};

const _$MaintenanceObjectEnumMap = {
  MaintenanceObject.equipment: 'equipment',
  MaintenanceObject.mold: 'mold',
};

const _$RequestStatusEnumMap = {
  RequestStatus.submitted: 'submitted',
  RequestStatus.rejected: 'rejected',
  RequestStatus.approved: 'approved',
};
