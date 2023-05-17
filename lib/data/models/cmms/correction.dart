import 'package:json_annotation/json_annotation.dart';

import 'cmms_enum.dart';

part 'correction.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class Correction {
  @JsonKey(name: 'correctionId')
  String? id;
  @JsonKey(name: 'correctionCode')
  String? code;
  @JsonKey(name: 'correctionName')
  String? name;
  // MaintenanceObject? maintenanceObject;
  int? estProcessTime;
  String? note;
  Correction({
    this.code,
    this.estProcessTime,
    this.id,
    // this.maintenanceObject,
    this.name,
    this.note,
  });
  factory Correction.fromJson(Map<String, dynamic> json) =>
      _$CorrectionFromJson(json);

  Map<String, dynamic> toJson() => _$CorrectionToJson(this);
}
