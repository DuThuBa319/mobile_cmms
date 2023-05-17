import 'package:json_annotation/json_annotation.dart';

import 'material_info.dart';

part 'material_request.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class MaterialRequest {
  String? id;
  String? code;
  MaterialInfo? materialInfo;
  double? currentQuantity;
  double? additionalQuantity;
  double? expectedQuantity;
  DateTime? expectedDate;
  // MaterialRequestStatus? status;
  MaterialRequest({
    this.additionalQuantity,
    this.code,
    this.currentQuantity,
    this.expectedDate,
    this.expectedQuantity,
    this.id,
    this.materialInfo,
    //this.status,
  });
  factory MaterialRequest.fromJson(Map<String, dynamic> json) =>
      _$MaterialRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MaterialRequestToJson(this);
}
