import 'package:json_annotation/json_annotation.dart';

import '../cmms_enum.dart';

part 'create_material.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class CreateMaterial {
  String? materialInfor;
  MaterialStatus? status;
  String? sku;

  CreateMaterial({
    this.materialInfor,
    this.sku,
    this.status,
  });
  factory CreateMaterial.fromJson(Map<String, dynamic> json) =>
      _$CreateMaterialFromJson(json);

  Map<String, dynamic> toJson() => _$CreateMaterialToJson(this);
}
