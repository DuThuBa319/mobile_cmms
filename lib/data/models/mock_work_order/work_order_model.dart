// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/work_order_entity.dart';
import 'device_model.dart';
part 'work_order_model.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class WorkOrderModel {
  List<DeviceObjectModel>? device;
  WorkOrderModel({
    this.device,
  });

  List<WorkOrderEntity>? getWorkOrderEntities({
    String dataRequest = '22/03/2023',
    String maintenanceTypeRequest = 'Đã lên lịch',
  }) {
    final result = <WorkOrderEntity>[];
    if (device == null) {
      return null;
    }
    if (dataRequest == 'Get all') {
      const c = 0;
      for (var i = 0; i < (device?.length ?? 0); i++) {
        result.add(
          WorkOrderEntity(
            id: device?[i].id,
            deviceName: device?[i].deviceName,
            timeUpdate: device?[i].timeUpdate,
            level: device?[i].level,
            status: device?[i].status,
            task: device?[i].task,
            maintenanceType: device?[i].maintenanceType == 'Khắc phục'
                ? MaintenanceType.corrective
                : MaintenanceType.preventive,
          ),
        );
      }
    } else {
      for (var i = 0; i < (device?.length ?? 0); i++) {
        if (device?[i].timeUpdate == dataRequest) {
          if (device?[i].maintenanceType == maintenanceTypeRequest) {
            result.add(
              WorkOrderEntity(
                id: device?[i].id,
                deviceName: device?[i].deviceName,
                timeUpdate: device?[i].timeUpdate,
                level: device?[i].level,
                status: device?[i].status,
                task: device?[i].task,
                maintenanceType: maintenanceTypeRequest == 'Đã lên lịch'
                    ? MaintenanceType.preventive
                    : MaintenanceType.corrective,
              ),
            );
          }
        }
      }
    }
    return result;
  }

  factory WorkOrderModel.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$WorkOrderModelToJson(this);
}
