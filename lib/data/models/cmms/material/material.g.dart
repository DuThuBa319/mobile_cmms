// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Materials _$MaterialsFromJson(Map<String, dynamic> json) => Materials(
      id: json['materialId'] as String?,
      materialInfo: json['materialInfo'] == null
          ? null
          : MaterialInfo.fromJson(json['materialInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MaterialsToJson(Materials instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('materialId', instance.id);
  writeNotNull('materialInfo', instance.materialInfo?.toJson());
  return val;
}
