// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
part 'device_model.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class DeviceObjectModel {
  int? id;
  @JsonKey(name: 'device_name')
  String? deviceName;
  @JsonKey(name: 'time_update')
  String? timeUpdate;
  String? level;
  String? status;
  String? task;
  @JsonKey(name: 'maintenance_type')
  String? maintenanceType;
  DeviceObjectModel({
    this.id,
    this.deviceName,
    this.level,
    this.status,
    this.timeUpdate,
    this.task,
    this.maintenanceType,
  });
  factory DeviceObjectModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceObjectModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceObjectModelToJson(this);
}
