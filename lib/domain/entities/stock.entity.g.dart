// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stock _$StockFromJson(Map<String, dynamic> json) => Stock(
      name: asOrNull(json['name']),
      scannedAt: asOrNull(json['scanned_at']),
      location: asOrNull(json['location_note']),
      number: asOrNull(json['number']),
      condition: asOrNull(json['condition']),
      sku: asOrNull(json['sku']),
    );

Map<String, dynamic> _$StockToJson(Stock instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('scanned_at', instance.scannedAt?.toIso8601String());
  writeNotNull('location_note', instance.location);
  writeNotNull('number', instance.number);
  writeNotNull('condition', instance.condition);
  writeNotNull('sku', instance.sku);
  return val;
}
