import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/cmms/maintenance_response_entity.dart';
import 'maintenance_response.dart';

part 'maintenance_response_item.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class MaintenanceResponseItem {
  List<MaintenanceResponse>? items;

  MaintenanceResponseItem({
    this.items,
  });

  MaintenanceResponseEntity? getMaintenanceResponseItemEntity() {
    final result = items?[0].getMaintenanceResponseEntity();

    return result;
  }

  factory MaintenanceResponseItem.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceResponseItemFromJson(json);

  Map<String, dynamic> toJson() => _$MaintenanceResponseItemToJson(this);
}
