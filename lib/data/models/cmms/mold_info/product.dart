import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class Product {
  String? code;
  String? name;
  double? quantity;
  Product({
    this.code,
    this.name,
    this.quantity,
  });
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
