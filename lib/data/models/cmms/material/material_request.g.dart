// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialRequest _$MaterialRequestFromJson(Map<String, dynamic> json) =>
    MaterialRequest(
      additionalQuantity: (json['additionalQuantity'] as num?)?.toDouble(),
      code: json['code'] as String?,
      currentQuantity: (json['currentQuantity'] as num?)?.toDouble(),
      expectedDate: json['expectedDate'] == null
          ? null
          : DateTime.parse(json['expectedDate'] as String),
      expectedQuantity: (json['expectedQuantity'] as num?)?.toDouble(),
      id: json['id'] as String?,
      materialInfo: json['materialInfo'] == null
          ? null
          : MaterialInfo.fromJson(json['materialInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MaterialRequestToJson(MaterialRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('code', instance.code);
  writeNotNull('materialInfo', instance.materialInfo?.toJson());
  writeNotNull('currentQuantity', instance.currentQuantity);
  writeNotNull('additionalQuantity', instance.additionalQuantity);
  writeNotNull('expectedQuantity', instance.expectedQuantity);
  writeNotNull('expectedDate', instance.expectedDate?.toIso8601String());
  return val;
}
