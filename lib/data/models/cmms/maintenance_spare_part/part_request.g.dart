// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SparePartInfo _$SparePartInfoFromJson(Map<String, dynamic> json) =>
    SparePartInfo(
      additionNumber: (json['additionNumber'] as num?)?.toDouble(),
      code: json['code'] as String?,
      currentNumber: (json['currentNumber'] as num?)?.toDouble(),
      expectedDate: json['expectedDate'] == null
          ? null
          : DateTime.parse(json['expectedDate'] as String),
      expectedNumber: (json['expectedNumber'] as num?)?.toDouble(),
      id: json['id'] as String?,
      sparePartInfo: json['sparePartInfo'] == null
          ? null
          : SparePartInfo.fromJson(
              json['sparePartInfo'] as Map<String, dynamic>),
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
  writeNotNull('sparePartInfo', instance.sparePartInfo?.toJson());
  writeNotNull('currentNumber', instance.currentNumber);
  writeNotNull('additionNumber', instance.additionNumber);
  writeNotNull('expectedNumber', instance.expectedNumber);
  writeNotNull('expectedDate', instance.expectedDate?.toIso8601String());
  return val;
}
