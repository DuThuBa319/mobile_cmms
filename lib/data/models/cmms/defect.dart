import 'package:json_annotation/json_annotation.dart';

import 'equipment/equipment.dart';
import 'maintenance_work_order.dart';
part 'defect.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class Defect {
  String? id;
  String? code;
  MaintenanceDefectType? maintenanceType;
  SolutionType? type;
  EquipmentType? equipmentType;
  String? name;
  Duration? estProcessTime;
  String? note;
  DefectSeverity? severity;
  Defect({
    this.code,
    this.equipmentType,
    this.estProcessTime,
    this.id,
    this.maintenanceType,
    this.name,
    this.note,
    this.severity,
    this.type,
  });
  factory Defect.fromJson(Map<String, dynamic> json) => _$DefectFromJson(json);

  Map<String, dynamic> toJson() => _$DefectToJson(this);
}

enum SolutionType { repair, replace }

enum DefectSeverity { urgent, high, normal, low }
