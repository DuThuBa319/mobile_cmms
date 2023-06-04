// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InspectionReport _$InspectionReportFromJson(Map<String, dynamic> json) =>
    InspectionReport(
      group: json['group'] as String?,
      isRequest: json['isRequest'] as bool?,
      name: json['name'] as String?,
      status: $enumDecodeNullable(
          _$PreventiveInspectionStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$InspectionReportToJson(InspectionReport instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('group', instance.group);
  writeNotNull('isRequest', instance.isRequest);
  writeNotNull('status', _$PreventiveInspectionStatusEnumMap[instance.status]);
  return val;
}

const _$PreventiveInspectionStatusEnumMap = {
  PreventiveInspectionStatus.passed: 'passed',
  PreventiveInspectionStatus.failed: 'failed',
  PreventiveInspectionStatus.uninspectable: 'uninspectable',
};
