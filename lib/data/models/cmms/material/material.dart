import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/cmms/material_entity.dart';
import '../cmms_enum.dart';
import 'material_info.dart';

part 'material.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class Materials {
  String? materialId;
  MaterialInfo? materialInfor;
  MaterialStatus? status;
  String? sku;

  Materials({
    this.materialId,
    this.materialInfor,
    this.sku,
    this.status,
  });

  MaterialEntity getMaterialEntity() {
    return MaterialEntity(
      materialId: materialId,
      materialInfoEntity: materialInfor!.getMaterialInfoEntity(),
      sku: sku,
      status: status,
    );
  }

  factory Materials.fromJson(Map<String, dynamic> json) =>
      _$MaterialsFromJson(json);

  Map<String, dynamic> toJson() => _$MaterialsToJson(this);
}
