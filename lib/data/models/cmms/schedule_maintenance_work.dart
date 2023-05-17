import 'package:json_annotation/json_annotation.dart';

import 'material/material.dart';
part 'schedule_maintenance_work.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class ScheduleMaintenanceWork {
  String? id;
  int? priority;
  String? deviceCode;
  String? problem;
  DateTime? dueDate;
  int? estProcessTime;
  List<Materials>? materials;
  ScheduleMaintenanceWork({
    this.deviceCode,
    this.dueDate,
    this.estProcessTime,
    this.id,
    this.materials,
    this.priority,
    this.problem,
  });
  factory ScheduleMaintenanceWork.fromJson(Map<String, dynamic> json) =>
      _$ScheduleMaintenanceWorkFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleMaintenanceWorkToJson(this);
}
