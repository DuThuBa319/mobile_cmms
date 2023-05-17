import 'package:json_annotation/json_annotation.dart';

import 'product.dart';
import 'standard.dart';
part 'mold_info.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class MoldInfo {
  List<Product>? products;

  Standard? standard;

  MoldInfo({
    this.products,
    this.standard,
  });
  factory MoldInfo.fromJson(Map<String, dynamic> json) =>
      _$MoldInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MoldInfoToJson(this);
}
