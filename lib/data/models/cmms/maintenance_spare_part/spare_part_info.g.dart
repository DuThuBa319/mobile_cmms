// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spare_part_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SparePartInfo _$SparePartInfoFromJson(Map<String, dynamic> json) =>
    SparePartInfo(
      id: json['id'] as String?,
      code: json['code'] as String?,
      minimumQuantity: (json['minimumQuantity'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$SparePartInfoToJson(SparePartInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('code', instance.code);
  writeNotNull('unit', instance.unit);
  writeNotNull('minimumQuantity', instance.minimumQuantity);
  return val;
}
