// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkOrderModel _$WorkOrderModelFromJson(Map<String, dynamic> json) =>
    WorkOrderModel(
      device: (json['device'] as List<dynamic>?)
          ?.map((e) => DeviceObjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WorkOrderModelToJson(WorkOrderModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('device', instance.device?.map((e) => e.toJson()).toList());
  return val;
}
