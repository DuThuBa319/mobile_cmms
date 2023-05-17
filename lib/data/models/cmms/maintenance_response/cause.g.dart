// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cause.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cause _$CauseFromJson(Map<String, dynamic> json) => Cause(
      code: json['causeCode'] as String?,
      id: json['causeId'] as String?,
      name: json['causeName'] as String?,
      note: json['note'] as String?,
      severity: json['severity'] as String?,
    );

Map<String, dynamic> _$CauseToJson(Cause instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('causeId', instance.id);
  writeNotNull('causeCode', instance.code);
  writeNotNull('causeName', instance.name);
  writeNotNull('note', instance.note);
  writeNotNull('severity', instance.severity);
  return val;
}
