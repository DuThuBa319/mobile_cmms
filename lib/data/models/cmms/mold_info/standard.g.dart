// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'standard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Standard _$StandardFromJson(Map<String, dynamic> json) => Standard(
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      kitTest: json['kitTest'] == null
          ? null
          : KitTest.fromJson(json['kitTest'] as Map<String, dynamic>),
      measurements: json['measurements'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$StandardToJson(Standard instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('images', instance.images);
  writeNotNull('measurements', instance.measurements);
  writeNotNull('kitTest', instance.kitTest?.toJson());
  return val;
}
