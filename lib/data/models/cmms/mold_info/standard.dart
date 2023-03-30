import 'package:json_annotation/json_annotation.dart';

import 'kit_test.dart';
part 'standard.g.dart';

@JsonSerializable(explicitToJson: true)
// ignore: must_be_immutable
class Standard {
  List<String>? images;
  Map<String, dynamic>? measurements;
  KitTest? kitTest;
  Standard({
    this.images,
    this.kitTest,
    this.measurements,
  });
  factory Standard.fromJson(Map<String, dynamic> json) =>
      _$StandardFromJson(json);

  Map<String, dynamic> toJson() => _$StandardToJson(this);
}
