import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/cmms/inspection_report_entity.dart';
import '../cmms_enum.dart';

part 'inspection_report.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class InspectionReport {
  // String? inspectionReportId;
  String? name;
  String? group;
  bool? isRequest;
  PreventiveInspectionStatus? status;

  InspectionReport({
    this.group,
    this.isRequest,
    this.name,
    this.status,
  });

  List<InspectionReportEntity> getListInspectionReportEntity({
    required List<InspectionReport> list,
  }) {
    final result = <InspectionReportEntity>[];
    for (final inspectionReport in list) {
      result.add(inspectionReport.getInspectionReportEntity());
    }

    return result;
  }

  InspectionReportEntity getInspectionReportEntity() {
    return InspectionReportEntity(
      name: name,
      group: group,
      isRequest: isRequest,
      status: status,
    );
  }

  factory InspectionReport.fromJson(Map<String, dynamic> json) =>
      _$InspectionReportFromJson(json);

  Map<String, dynamic> toJson() => _$InspectionReportToJson(this);
}
