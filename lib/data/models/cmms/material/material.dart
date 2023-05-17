import 'package:json_annotation/json_annotation.dart';

import 'material_info.dart';

part 'material.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class Materials {
  @JsonKey(name: 'materialId')
  String? id;
  MaterialInfo? materialInfo;
  Materials({
    this.id,
    this.materialInfo,
  });
  factory Materials.fromJson(Map<String, dynamic> json) =>
      _$MaterialsFromJson(json);

  Map<String, dynamic> toJson() => _$MaterialsToJson(this);
}
