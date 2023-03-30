import 'package:json_annotation/json_annotation.dart';
part 'equipment_info.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class EquipmentInfo {
  String? code;
  String? name;
  EquipmentInfo({
    this.code,
    this.name,
  });
  factory EquipmentInfo.fromJson(Map<String, dynamic> json) =>
      _$EquipmentInfoFromJson(json);

  Map<String, dynamic> toJson() => _$EquipmentInfoToJson(this);
}
