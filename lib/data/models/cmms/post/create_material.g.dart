// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_material.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateMaterial _$CreateMaterialFromJson(Map<String, dynamic> json) =>
    CreateMaterial(
      materialInfor: json['materialInfor'] as String?,
      sku: json['sku'] as String?,
      status: $enumDecodeNullable(_$MaterialStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$CreateMaterialToJson(CreateMaterial instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('materialInfor', instance.materialInfor);
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
