// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialInfo _$MaterialInfoFromJson(Map<String, dynamic> json) => MaterialInfo(
      code: json['code'] as String?,
      minimumQuantity: (json['minimumQuantity'] as num?)?.toDouble(),
      name: json['name'] as String?,
      note: json['note'] as String?,
      specs: (json['specs'] as List<dynamic>?)
          ?.map((e) => Map<String, String>.from(e as Map))
          .toList(),
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$MaterialInfoToJson(MaterialInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('name', instance.name);
  writeNotNull('unit', instance.unit);
  writeNotNull('minimumQuantity', instance.minimumQuantity);
  writeNotNull('note', instance.note);
  writeNotNull('specs', instance.specs);
  return val;
}
