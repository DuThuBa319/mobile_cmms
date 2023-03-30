import 'package:json_annotation/json_annotation.dart';

import 'defect.dart';
import 'employee.dart';
import 'equipment/equipment.dart';
import 'maintenance_request.dart';
import 'maintenance_spare_part/maintenance_part.dart';
part 'maintenance_work_order.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class MaintenanceWorkOrder {
  String? id;
  DateTime? plannedStart;
  DateTime? plannedFinish;
  MaintenanceStatus? status;
  String? code;
  MaintenanceDefectType? type;
  MaintenanceRequest? request;
  Equipment? equipment;
  String? problem;
  List<Defect>? defects;
  Employee? responsiblePerson;
  Employee? reviewer;
  List<MaintenancePart>? resources;
  MaintenanceWorkOrder({
    this.id,
    this.plannedStart,
    this.plannedFinish,
    this.status,
    this.code,
    this.equipment,
    this.problem,
    this.request,
    this.type,
    this.defects,
    this.responsiblePerson,
    this.reviewer,
    this.resources,
  });
  factory MaintenanceWorkOrder.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceWorkOrderFromJson(json);

  Map<String, dynamic> toJson() => _$MaintenanceWorkOrderToJson(this);
}

enum MaintenanceStatus { assigned, inProgress, review, completed }

enum MaintenanceDefectType { reactive, preventive, predictive }
