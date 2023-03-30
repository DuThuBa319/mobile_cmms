// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_part.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaintenancePart _$MaintenancePartFromJson(Map<String, dynamic> json) =>
    MaintenancePart(
      id: json['id'] as String?,
      sparePartInfo: json['sparePartInfo'] == null
          ? null
          : SparePartInfo.fromJson(
              json['sparePartInfo'] as Map<String, dynamic>),
      available: (json['available'] as num?)?.toDouble(),
      quantity: (json['quantity'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MaintenancePartToJson(MaintenancePart instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('sparePartInfo', instance.sparePartInfo?.toJson());
  writeNotNull('quantity', instance.quantity);
  writeNotNull('available', instance.available);
  return val;
}
