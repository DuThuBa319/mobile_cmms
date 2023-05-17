import 'package:json_annotation/json_annotation.dart';

import 'material/material_info.dart';

part 'equipment_material.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class EquipmentMaterial {
  String? id;
  MaterialInfo? materialInfo;
  double? fullTime;
  double? usedTime;
  DateTime? installedTime;
  EquipmentMaterial({
    this.fullTime,
    this.id,
    this.installedTime,
    this.materialInfo,
    this.usedTime,
  });
  factory EquipmentMaterial.fromJson(Map<String, dynamic> json) =>
      _$EquipmentMaterialFromJson(json);

  Map<String, dynamic> toJson() => _$EquipmentMaterialToJson(this);
}
