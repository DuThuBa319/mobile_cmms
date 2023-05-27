import 'package:json_annotation/json_annotation.dart';

import '../cmms_enum.dart';
import 'material_info.dart';

part 'material.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class Materials {
  String? materialId;
  MaterialInfo? materialInfo;
  MaterialStatus? status;
  String? sku;

  Materials({
    this.materialId,
    this.materialInfo,
    this.sku,
    this.status,
  });
  factory Materials.fromJson(Map<String, dynamic> json) =>
      _$MaterialsFromJson(json);

  Map<String, dynamic> toJson() => _$MaterialsToJson(this);
}
