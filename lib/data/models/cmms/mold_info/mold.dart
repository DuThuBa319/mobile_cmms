import 'package:json_annotation/json_annotation.dart';

import '../chart_obj.dart';
import '../equipment/performance_index.dart';
import '../equipment_material.dart';

import '../maintenance_response/maintenance_response.dart';
import 'product.dart';
import 'standard.dart';

part 'mold.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class Mold {
  String? id;
  String? code;
  String? name;
  int? cavity;
  List<Product>? products;
  String? documentLink;
  List<String>? images;
  Standard? standards;
  PerformanceIndex? mtbf;
  PerformanceIndex? mttf;
  PerformanceIndex? oee;
  // MaintenanceStatus? status;
  List<MaintenanceResponse>? recentMaintenanceResponse;
  List<ChartObj>? errors;
  List<EquipmentMaterial>? material;
  Mold({
    this.id,
    this.code,
    this.name,
    this.cavity,
    this.products,
    this.documentLink,
    this.errors,
    this.images,
    this.material,
    this.mtbf,
    this.mttf,
    this.oee,
    this.recentMaintenanceResponse,
    this.standards,
    // this.status,
  });
  factory Mold.fromJson(Map<String, dynamic> json) => _$MoldFromJson(json);

  Map<String, dynamic> toJson() => _$MoldToJson(this);
}
