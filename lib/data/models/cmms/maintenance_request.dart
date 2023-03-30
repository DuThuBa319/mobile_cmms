import 'package:json_annotation/json_annotation.dart';

import 'employee.dart';
import 'equipment/equipment.dart';
import 'maintenance_work_order.dart';
part 'maintenance_request.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class MaintenanceRequest {
  String? id;
  DateTime? requestedCompletionDate;
  DateTime? submissionDate;
  String? code;
  MaintenanceDefectType? type;
  int? requestPriority;
  Equipment? equipment;
  String? problem;
  RequestStatus? status;
  Employee? requestor;
  Employee? reviewer;
  MaintenanceRequest({
    this.id,
    this.requestedCompletionDate,
    this.submissionDate,
    this.status,
    this.code,
    this.equipment,
    this.problem,
    this.requestPriority,
    this.type,
    this.requestor,
    this.reviewer,
  });
  factory MaintenanceRequest.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MaintenanceRequestToJson(this);
}

enum RequestStatus { submitted, reject, approved }
