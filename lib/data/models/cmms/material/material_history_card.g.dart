// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_history_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialHistoryCard _$MaterialHistoryCardFromJson(Map<String, dynamic> json) =>
    MaterialHistoryCard(
      after: (json['after'] as num?)?.toDouble(),
      before: (json['before'] as num?)?.toDouble(),
      input: (json['input'] as num?)?.toDouble(),
      output: (json['output'] as num?)?.toDouble(),
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      warehouseMaterial: json['warehouseMaterial'] == null
          ? null
          : WarehouseMaterial.fromJson(
              json['warehouseMaterial'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MaterialHistoryCardToJson(MaterialHistoryCard instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('timestamp', instance.timestamp?.toIso8601String());
  writeNotNull('before', instance.before);
  writeNotNull('input', instance.input);
  writeNotNull('output', instance.output);
  writeNotNull('after', instance.after);
  writeNotNull('warehouseMaterial', instance.warehouseMaterial?.toJson());
  return val;
}
