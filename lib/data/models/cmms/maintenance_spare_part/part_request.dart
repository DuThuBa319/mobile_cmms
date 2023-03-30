import 'package:json_annotation/json_annotation.dart';
part 'part_request.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class SparePartInfo {
  String? id;
  String? code;
  SparePartInfo? sparePartInfo;
  double? currentNumber;
  double? additionNumber;
  double? expectedNumber;
  DateTime? expectedDate;
  SparePartInfo({
    this.additionNumber,
    this.code,
    this.currentNumber,
    this.expectedDate,
    this.expectedNumber,
    this.id,
    this.sparePartInfo,
  });
  factory SparePartInfo.fromJson(Map<String, dynamic> json) =>
      _$SparePartInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SparePartInfoToJson(this);
}
