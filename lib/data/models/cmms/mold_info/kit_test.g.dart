// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kit_test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KitTest _$KitTestFromJson(Map<String, dynamic> json) => KitTest(
      code: json['code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$KitTestToJson(KitTest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('name', instance.name);
  return val;
}
