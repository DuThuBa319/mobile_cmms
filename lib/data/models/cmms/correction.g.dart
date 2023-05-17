// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'correction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Correction _$CorrectionFromJson(Map<String, dynamic> json) => Correction(
      code: json['correctionCode'] as String?,
      estProcessTime: json['estProcessTime'] as int?,
      id: json['correctionId'] as String?,
      name: json['correctionName'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$CorrectionToJson(Correction instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('correctionId', instance.id);
  writeNotNull('correctionCode', instance.code);
  writeNotNull('correctionName', instance.name);
  writeNotNull('estProcessTime', instance.estProcessTime);
  writeNotNull('note', instance.note);
  return val;
}
