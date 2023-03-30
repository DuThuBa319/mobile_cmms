import 'package:json_annotation/json_annotation.dart';

import 'product.dart';
import 'standard.dart';
part 'mold_info.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class MoldInfo {
  int? cavity;
  List<Product>? products;
  String? documentLink;
  List<String>? images;
  Standard? standard;

  MoldInfo({
    this.cavity,
    this.documentLink,
    this.images,
    this.products,
    this.standard,
  });
  factory MoldInfo.fromJson(Map<String, dynamic> json) =>
      _$MoldInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MoldInfoToJson(this);
}
