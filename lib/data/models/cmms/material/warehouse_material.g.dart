// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_material.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WarehouseMaterial _$WarehouseMaterialFromJson(Map<String, dynamic> json) =>
    WarehouseMaterial(
      currentQuantity: (json['currentQuantity'] as num?)?.toDouble(),
      isEnough: json['isEnough'] as bool?,
      materialInfo: json['materialInfo'] == null
          ? null
          : MaterialInfo.fromJson(json['materialInfo'] as Map<String, dynamic>),
      requestingQuantity: (json['requestingQuantity'] as num?)?.toDouble(),
      requests: json['requests'] == null
          ? null
          : MaterialRequest.fromJson(json['requests'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WarehouseMaterialToJson(WarehouseMaterial instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('materialInfo', instance.materialInfo?.toJson());
  writeNotNull('currentQuantity', instance.currentQuantity);
  writeNotNull('isEnough', instance.isEnough);
  writeNotNull('requestingQuantity', instance.requestingQuantity);
  writeNotNull('requests', instance.requests?.toJson());
  return val;
}
