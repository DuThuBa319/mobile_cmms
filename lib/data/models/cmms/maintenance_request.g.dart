// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaintenanceRequest _$MaintenanceRequestFromJson(Map<String, dynamic> json) =>
    MaintenanceRequest(
      id: json['id'] as String?,
      requestedCompletionDate: json['requestedCompletionDate'] == null
          ? null
          : DateTime.parse(json['requestedCompletionDate'] as String),
      submissionDate: json['submissionDate'] == null
          ? null
          : DateTime.parse(json['submissionDate'] as String),
      status: $enumDecodeNullable(_$RequestStatusEnumMap, json['status']),
      code: json['code'] as String?,
      equipment: json['equipment'] == null
          ? null
          : Equipment.fromJson(json['equipment'] as Map<String, dynamic>),
      problem: json['problem'] as String?,
      requestPriority: json['requestPriority'] as int?,
      type: $enumDecodeNullable(_$MaintenanceDefectTypeEnumMap, json['type']),
      requestor: json['requestor'] == null
          ? null
          : Employee.fromJson(json['requestor'] as Map<String, dynamic>),
      reviewer: json['reviewer'] == null
          ? null
          : Employee.fromJson(json['reviewer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MaintenanceRequestToJson(MaintenanceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('requestedCompletionDate',
      instance.requestedCompletionDate?.toIso8601String());
  writeNotNull('submissionDate', instance.submissionDate?.toIso8601String());
  writeNotNull('code', instance.code);
  writeNotNull('type', _$MaintenanceDefectTypeEnumMap[instance.type]);
  writeNotNull('requestPriority', instance.requestPriority);
  writeNotNull('equipment', instance.equipment?.toJson());
  writeNotNull('problem', instance.problem);
  writeNotNull('status', _$RequestStatusEnumMap[instance.status]);
  writeNotNull('requestor', instance.requestor?.toJson());
  writeNotNull('reviewer', instance.reviewer?.toJson());
  return val;
}

const _$RequestStatusEnumMap = {
  RequestStatus.submitted: 'submitted',
  RequestStatus.reject: 'reject',
  RequestStatus.approved: 'approved',
};

const _$MaintenanceDefectTypeEnumMap = {
  MaintenanceDefectType.reactive: 'reactive',
  MaintenanceDefectType.preventive: 'preventive',
  MaintenanceDefectType.predictive: 'predictive',
};
