import 'package:json_annotation/json_annotation.dart';

import 'spare_part_info.dart';
part 'spare_part.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class SparePart {
  String? id;
  SparePartInfo? sparePartInfo;
  SparePartStatus? status;
  double? currentQuantity;
  bool? requested;
  SparePart({
    this.currentQuantity,
    this.id,
    this.sparePartInfo,
    this.status,
    this.requested,
  });
  factory SparePart.fromJson(Map<String, dynamic> json) =>
      _$SparePartFromJson(json);

  Map<String, dynamic> toJson() => _$SparePartToJson(this);
}

enum SparePartStatus { sufficient, insufficient }
