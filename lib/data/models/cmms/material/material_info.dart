import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/cmms/material_info_entity.dart';

part 'material_info.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class MaterialInfo {
  String? code;
  String? name;
  String? unit;
  double? minimumQuantity;
  String? materialInforId;
//  String? note;
  // List<String>? image;
  // List<Map<String, String>>? specs;
  MaterialInfo({
    this.code,
    //  this.image,
    this.minimumQuantity,
    this.name,
    //  this.note,
    //  this.specs,
    this.unit,
    this.materialInforId,
  });
  MaterialInfoEntity getMaterialInfoEntity() {
    final result = MaterialInfoEntity(
      name: name,
      code: code,
      unit: unit,
      minimumQuantity: minimumQuantity,
      materialInforId: materialInforId,
    );

    return result;
  }

  factory MaterialInfo.fromJson(Map<String, dynamic> json) =>
      _$MaterialInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MaterialInfoToJson(this);
}
