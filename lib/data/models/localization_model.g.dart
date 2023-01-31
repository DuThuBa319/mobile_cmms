// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalizationModel _$LocalizationModelFromJson(Map<String, dynamic> json) =>
    LocalizationModel()
      ..vi = json['vi'] as String?
      ..en = json['en'] as String?;

Map<String, dynamic> _$LocalizationModelToJson(LocalizationModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('vi', instance.vi);
  writeNotNull('en', instance.en);
  return val;
}
