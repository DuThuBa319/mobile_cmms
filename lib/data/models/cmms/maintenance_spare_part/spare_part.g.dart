// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spare_part.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SparePart _$SparePartFromJson(Map<String, dynamic> json) => SparePart(
      currentQuantity: (json['currentQuantity'] as num?)?.toDouble(),
      id: json['id'] as String?,
      sparePartInfo: json['sparePartInfo'] == null
          ? null
          : SparePartInfo.fromJson(
              json['sparePartInfo'] as Map<String, dynamic>),
      status: $enumDecodeNullable(_$SparePartStatusEnumMap, json['status']),
      requested: json['requested'] as bool?,
    );

Map<String, dynamic> _$SparePartToJson(SparePart instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('sparePartInfo', instance.sparePartInfo?.toJson());
  writeNotNull('status', _$SparePartStatusEnumMap[instance.status]);
  writeNotNull('currentQuantity', instance.currentQuantity);
  writeNotNull('requested', instance.requested);
  return val;
}

const _$SparePartStatusEnumMap = {
  SparePartStatus.sufficient: 'sufficient',
  SparePartStatus.insufficient: 'insufficient',
};
