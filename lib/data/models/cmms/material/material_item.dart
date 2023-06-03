import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/cmms/material_entity.dart';
import 'material.dart';

part 'material_item.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class MaterialItems {
  List<Materials>? items;
  MaterialItems({
    this.items,
  });

  MaterialEntity? getMaterialItemEntity() {
    final result = items?[0].getMaterialEntity();
    return result;
  }

  factory MaterialItems.fromJson(Map<String, dynamic> json) =>
      _$MaterialItemsFromJson(json);

  Map<String, dynamic> toJson() => _$MaterialItemsToJson(this);
}
