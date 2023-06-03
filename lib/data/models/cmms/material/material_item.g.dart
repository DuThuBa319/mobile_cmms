// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaterialItems _$MaterialItemsFromJson(Map<String, dynamic> json) =>
    MaterialItems(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Materials.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MaterialItemsToJson(MaterialItems instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  return val;
}
