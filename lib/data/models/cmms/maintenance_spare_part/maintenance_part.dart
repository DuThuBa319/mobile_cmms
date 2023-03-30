import 'package:json_annotation/json_annotation.dart';

import 'part_request.dart';
part 'maintenance_part.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class MaintenancePart {
  String? id;
  SparePartInfo? sparePartInfo;
  double? quantity;
  double? available;
  MaintenancePart({
    this.id,
    this.sparePartInfo,
    this.available,
    this.quantity,
  });
  factory MaintenancePart.fromJson(Map<String, dynamic> json) =>
      _$MaintenancePartFromJson(json);

  Map<String, dynamic> toJson() => _$MaintenancePartToJson(this);
}
