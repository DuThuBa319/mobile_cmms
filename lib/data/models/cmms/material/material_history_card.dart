import 'package:json_annotation/json_annotation.dart';
import 'warehouse_material.dart';

part 'material_history_card.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class MaterialHistoryCard {
  DateTime? timestamp;
  double? before;
  double? input;
  double? output;
  double? after;
  WarehouseMaterial? warehouseMaterial;
  MaterialHistoryCard({
    this.after,
    this.before,
    this.input,
    this.output,
    this.timestamp,
    this.warehouseMaterial,
  });
  factory MaterialHistoryCard.fromJson(Map<String, dynamic> json) =>
      _$MaterialHistoryCardFromJson(json);

  Map<String, dynamic> toJson() => _$MaterialHistoryCardToJson(this);
}
