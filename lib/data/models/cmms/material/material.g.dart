// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Materials _$MaterialsFromJson(Map<String, dynamic> json) => Materials(
      materialId: json['materialId'] as String?,
      materialInfor: json['materialInfor'] == null
          ? null
          : MaterialInfo.fromJson(
              json['materialInfor'] as Map<String, dynamic>),
      sku: json['sku'] as String?,
      status: $enumDecodeNullable(_$MaterialStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$MaterialsToJson(Materials instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('materialId', instance.materialId);
  writeNotNull('materialInfor', instance.materialInfor?.toJson());
  writeNotNull('status', _$MaterialStatusEnumMap[instance.status]);
  writeNotNull('sku', instance.sku);
  return val;
}

const _$MaterialStatusEnumMap = {
  MaterialStatus.inUsed: 'inUsed',
  MaterialStatus.expired: 'expired',
  MaterialStatus.error: 'error',
  MaterialStatus.missing: 'missing',
  MaterialStatus.available: 'available',
};
