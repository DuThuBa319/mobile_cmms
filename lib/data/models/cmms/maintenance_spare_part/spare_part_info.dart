import 'package:json_annotation/json_annotation.dart';
part 'spare_part_info.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class SparePartInfo {
  String? id;
  String? code;
  String? unit;
  double? minimumQuantity;
  SparePartInfo({
    this.id,
    this.code,
    this.minimumQuantity,
    this.unit,
  });
  factory SparePartInfo.fromJson(Map<String, dynamic> json) =>
      _$SparePartInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SparePartInfoToJson(this);
}
