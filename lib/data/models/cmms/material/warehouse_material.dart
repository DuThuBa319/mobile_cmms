import 'package:json_annotation/json_annotation.dart';

import 'material_info.dart';
import 'material_request.dart';

part 'warehouse_material.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class WarehouseMaterial {
  MaterialInfo? materialInfo;
  double? currentQuantity;
  bool? isEnough;
  double? requestingQuantity;
  MaterialRequest? requests;

  WarehouseMaterial({
    this.currentQuantity,
    this.isEnough,
    this.materialInfo,
    this.requestingQuantity,
    this.requests,
  });
  factory WarehouseMaterial.fromJson(Map<String, dynamic> json) =>
      _$WarehouseMaterialFromJson(json);

  Map<String, dynamic> toJson() => _$WarehouseMaterialToJson(this);
}
