import 'package:json_annotation/json_annotation.dart';

part 'maintenance_work_order.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class MaintenanceWorkOrder {
  MaintenanceWorkOrder();
  factory MaintenanceWorkOrder.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceWorkOrderFromJson(json);

  Map<String, dynamic> toJson() => _$MaintenanceWorkOrderToJson(this);
}
