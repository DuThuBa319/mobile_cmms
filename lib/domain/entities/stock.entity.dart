import 'package:json_annotation/json_annotation.dart';

import '../../common/utils/data_checker.dart';

part 'stock.entity.g.dart';

@JsonSerializable(
  includeIfNull: false,
  explicitToJson: true,
)
class Stock {
  @JsonKey(name: 'name', fromJson: asOrNull)
  final String? name;

  @JsonKey(name: 'scanned_at', fromJson: asOrNull)
  final DateTime? scannedAt;

  @JsonKey(name: 'location_note', fromJson: asOrNull)
  final String? location;

  @JsonKey(name: 'number', fromJson: asOrNull)
  final String? number;

  @JsonKey(name: 'condition', fromJson: asOrNull)
  final String? condition;

  @JsonKey(name: 'sku', fromJson: asOrNull)
  final String? sku;

  Stock({
    this.name,
    this.scannedAt,
    this.location,
    this.number,
    this.condition,
    this.sku,
  });

  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);

  Map<String, dynamic> toJson() => _$StockToJson(this);
}
