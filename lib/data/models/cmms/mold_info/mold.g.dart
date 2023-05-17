// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mold.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mold _$MoldFromJson(Map<String, dynamic> json) => Mold(
      id: json['id'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      cavity: json['cavity'] as int?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      documentLink: json['documentLink'] as String?,
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => ChartObj.fromJson(e as Map<String, dynamic>))
          .toList(),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      material: (json['material'] as List<dynamic>?)
          ?.map((e) => EquipmentMaterial.fromJson(e as Map<String, dynamic>))
          .toList(),
      mtbf: json['mtbf'] == null
          ? null
          : PerformanceIndex.fromJson(json['mtbf'] as Map<String, dynamic>),
      mttf: json['mttf'] == null
          ? null
          : PerformanceIndex.fromJson(json['mttf'] as Map<String, dynamic>),
      oee: json['oee'] == null
          ? null
          : PerformanceIndex.fromJson(json['oee'] as Map<String, dynamic>),
      recentMaintenanceResponse: (json['recentMaintenanceResponse']
              as List<dynamic>?)
          ?.map((e) => MaintenanceResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      standards: json['standards'] == null
          ? null
          : Standard.fromJson(json['standards'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MoldToJson(Mold instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('code', instance.code);
  writeNotNull('name', instance.name);
  writeNotNull('cavity', instance.cavity);
  writeNotNull('products', instance.products?.map((e) => e.toJson()).toList());
  writeNotNull('documentLink', instance.documentLink);
  writeNotNull('images', instance.images);
  writeNotNull('standards', instance.standards?.toJson());
  writeNotNull('mtbf', instance.mtbf?.toJson());
  writeNotNull('mttf', instance.mttf?.toJson());
  writeNotNull('oee', instance.oee?.toJson());
  writeNotNull('recentMaintenanceResponse',
      instance.recentMaintenanceResponse?.map((e) => e.toJson()).toList());
  writeNotNull('errors', instance.errors?.map((e) => e.toJson()).toList());
  writeNotNull('material', instance.material?.map((e) => e.toJson()).toList());
  return val;
}
