import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/cmms/equipment_entity.dart';
import '../chart_obj.dart';
import '../cmms_enum.dart';
import '../equipment_material.dart';
import '../maintenance_response/maintenance_response.dart';

import 'performance_index.dart';

part 'equipment.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class Equipment {
  @JsonKey(name: 'equipmentId')
  String? id;
  String? name;
  String? code;
  EquipmentType? type;
  PerformanceIndex? mttf;
  PerformanceIndex? mtbf;
  PerformanceIndex? oee;
  //MaintenanceObjectStatus? status;
  MaintenanceResponse? recentMaintenanceWorkOrder;
  List<ChartObj>? errors;
  List<EquipmentMaterial>? material;
  //List<WorkingTime>? scheduleWorkingTimes;
  Equipment({
    this.id,
    this.name,
    this.code,
    this.mtbf,
    this.mttf,
    this.oee,
    this.recentMaintenanceWorkOrder,
    // this.status,
    this.errors,
    this.material,
    //  this.scheduleWorkingTimes,
    this.type,
  });

  List<EquipmentEntity> getListEquipmentsEntity({
    required List<EquipmentEntity> list,
  }) {
    final result = EquipmentEntity(
      name: name,
      code: code,
      type: type,
    );
    list.add(result);

    return list;
  }

  EquipmentEntity? getEquipmentEntity() {
    return EquipmentEntity(
      name: name,
      code: code,
      type: type,
    );
  }

  factory Equipment.fromJson(Map<String, dynamic> json) =>
      _$EquipmentFromJson(json);

  Map<String, dynamic> toJson() => _$EquipmentToJson(this);
}
