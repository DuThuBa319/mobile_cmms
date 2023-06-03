// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateRequest _$CreateRequestFromJson(Map<String, dynamic> json) =>
    CreateRequest(
      equipmentCode: json['equipment'] as String?,
      problem: json['problem'] as String?,
      requestedPriority: json['requestedPriority'] as int?,
      type: $enumDecodeNullable(_$MaintenanceTypeEnumMap, json['type']),
      requester: json['requester'] as String?,
      maintenanceObject: $enumDecodeNullable(
          _$MaintenanceObjectEnumMap, json['maintenanceObject']),
      status: $enumDecodeNullable(_$RequestStatusEnumMap, json['status']),
      requestedCompletionDate: json['requestedCompletionDate'] == null
          ? null
          : DateTime.parse(json['requestedCompletionDate'] as String),
      responsiblePerson: json['responsiblePerson'] as String?,
      submissionDate: json['submissionDate'] == null
          ? null
          : DateTime.parse(json['submissionDate'] as String),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      sounds:
          (json['sounds'] as List<dynamic>?)?.map((e) => e as String).toList(),
      moldCode: json['mold'] as String?,
    );

Map<String, dynamic> _$CreateRequestToJson(CreateRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('requestedCompletionDate',
      instance.requestedCompletionDate?.toIso8601String());
  writeNotNull('submissionDate', instance.submissionDate?.toIso8601String());
  writeNotNull('type', _$MaintenanceTypeEnumMap[instance.type]);
  writeNotNull('requestedPriority', instance.requestedPriority);
  writeNotNull('equipment', instance.equipmentCode);
  writeNotNull('problem', instance.problem);
  writeNotNull('status', _$RequestStatusEnumMap[instance.status]);
  writeNotNull('requester', instance.requester);
  writeNotNull('responsiblePerson', instance.responsiblePerson);
  writeNotNull('maintenanceObject',
      _$MaintenanceObjectEnumMap[instance.maintenanceObject]);
  writeNotNull('images', instance.images);
  writeNotNull('sounds', instance.sounds);
  writeNotNull('mold', instance.moldCode);
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
