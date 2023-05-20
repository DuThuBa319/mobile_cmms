// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_response_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaintenanceResponseItem _$MaintenanceResponseItemFromJson(
        Map<String, dynamic> json) =>
    MaintenanceResponseItem(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => MaintenanceResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MaintenanceResponseItemToJson(
    MaintenanceResponseItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  return val;
}
