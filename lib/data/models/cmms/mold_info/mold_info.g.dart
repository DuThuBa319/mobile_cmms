// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mold_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoldInfo _$MoldInfoFromJson(Map<String, dynamic> json) => MoldInfo(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      standard: json['standard'] == null
          ? null
          : Standard.fromJson(json['standard'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MoldInfoToJson(MoldInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('products', instance.products?.map((e) => e.toJson()).toList());
  writeNotNull('standard', instance.standard?.toJson());
  return val;
}
