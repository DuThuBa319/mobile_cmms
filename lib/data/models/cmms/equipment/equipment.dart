import 'package:json_annotation/json_annotation.dart';

import '../maintenance_work_order.dart';
import 'performance_index.dart';
part 'equipment.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class Equipment {
  String? id;
  String? name;
  String? code;
  EquipmentType? type;
  PerformanceIndex? mttf;
  PerformanceIndex? mtbf;
  PerformanceIndex? oee;
  MaintenanceStatus? status;
  MaintenanceWorkOrder? recentMaintenanceWorkOrder;
  Equipment({
    this.id,
    this.name,
    this.code,
    this.mtbf,
    this.mttf,
    this.oee,
    this.recentMaintenanceWorkOrder,
    this.status,
  });
  factory Equipment.fromJson(Map<String, dynamic> json) =>
      _$EquipmentFromJson(json);

  Map<String, dynamic> toJson() => _$EquipmentToJson(this);
}

enum EquipmentType { bigInjector, smallInjector, mold }
